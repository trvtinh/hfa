import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/medical_data.dart';
import 'package:health_for_all/pages/connect_hardware/state.dart';
import 'connection_page.dart';

class ConnectHardwareController extends GetxController {
  final state = ConnectHardwareState();
  StreamSubscription? streamSubscription; // To manage the stream
  StreamSubscription? notificationSubscription; // To manage the stream
  final writeDataController = TextEditingController();
  final readDataController = TextEditingController();
  var scannedDevices = <ScanResult>[].obs;
  Rx<BluetoothCharacteristic?> readCharacteristic =
      Rx<BluetoothCharacteristic?>(null);
  Rx<BluetoothCharacteristic?> writeCharacteristic =
      Rx<BluetoothCharacteristic?>(null);
  bool isFoundreadCharacteristic = false;
  bool isFoundwriteCharacteristic = false;
  RxString remoteId = "".obs;
  Map<String, dynamic> currentData = {};

  RxString storageDataReceive = "".obs;
  RxList<String> storageDataSend = <String>[].obs;
  // Start scanning for BLE devices
  Future<void> scanDevice() async {
    log('Scanning for devices...');
    scannedDevices.clear();

    // Subscribe to scan results
    streamSubscription = FlutterBluePlus.onScanResults.listen(
      (results) async {
        if (results.isNotEmpty) {
          ScanResult r = results.last; // Get the last scanned device
          log('Found device: ${r.device.remoteId}: "${r.advertisementData.advName}"');
          scannedDevices.add(r);
          Get.back();
          // Add the device to the list
        }
      },
      onError: (e) => log('Scan error: $e'),
    );
    FlutterBluePlus.cancelWhenScanComplete(streamSubscription!);

    await FlutterBluePlus.adapterState
        .where((state) => state == BluetoothAdapterState.on)
        .first;

    await FlutterBluePlus.startScan(
      withRemoteIds: [remoteId.value],
    );

    // Wait until scanning stops
    await FlutterBluePlus.isScanning.where((val) => val == false).first;

    streamSubscription?.cancel();
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      log('Connecting to ${device.remoteId}');
      await device.connect();
      log('Connected to ${device.remoteId}');

      List<BluetoothService> services = await device.discoverServices();
      log('Services discovered: ${services.length}');

      for (BluetoothService service in services) {
        log('Service UUID: ${service.uuid}');

        for (BluetoothCharacteristic char in service.characteristics) {
          // log('Characteristic UUID: ${char.uuid}, properties: ${char.properties.notify}');

          // Sử dụng đặc tính có notify để nhận dữ liệu
          if (char.properties.notify && !isFoundreadCharacteristic) {
            log('Found the notify characteristic');
            readCharacteristic = Rx<BluetoothCharacteristic>(char);
            // Kích hoạt chế độ notify
            enableNotifications();
            isFoundreadCharacteristic = true;
          }

          // Sử dụng đặc tính có write để gửi dữ liệu
          if (char.properties.write && !isFoundwriteCharacteristic) {
            log('Found the write characteristic');
            writeCharacteristic = Rx<BluetoothCharacteristic>(char);
            isFoundwriteCharacteristic = true;
            writeCharacteristic.value!.write("hello".codeUnits);
          }
          if (isFoundreadCharacteristic && isFoundwriteCharacteristic) {
            break;
          }
        }
        if (isFoundreadCharacteristic && isFoundwriteCharacteristic) {
          break;
        }
      }
    } catch (e) {
      log('Error connecting to device: $e');
    }
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String formatTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void processData() {
    int medId = currentData["dataType"];
    List<dynamic> value = currentData["dataValue"];
    int interval = currentData["interval"];
    DateTime now = DateTime.now();
    List<DateTime> time = [];
    for (int i = value.length - 1; i >= 0; i--) {
      time.add(now.subtract(Duration(milliseconds: interval * i)));
    }
    for (int i = 0; i < value.length; i++) {
      state.medDate.add(formatDate(time[i]));
      state.medTime.add(formatTime(time[i]));
      state.medId.add(medId);
      state.medPass.add(time[i]);
      state.medValue.add(value[i]);
    }
  }

  Future<void> enableNotifications() async {
    try {
      // Lắng nghe dữ liệu được gửi từ ESP32 qua notify
      notificationSubscription?.cancel();

      await readCharacteristic.value?.setNotifyValue(true); // Kích hoạt notify
      log('Notifications enabled.');

      // Lắng nghe dữ liệu được gửi từ ESP32 qua notify
      notificationSubscription =
          readCharacteristic.value?.onValueReceived.listen((data) {
        String receivedData = String.fromCharCodes(data);
        log('Received data 1: $receivedData');
        currentData = jsonDecode(receivedData);
        processData();
        storageDataReceive.value += receivedData;
        log('Received data 2: $receivedData');
      }, onError: (error) {
        log('Error receiving data: $error');
      });
    } catch (e) {
      log('Failed to enable notifications: $e');
    }
  }

  Future<void> disableNotifications() async {
    if (readCharacteristic.value != null) {
      await readCharacteristic.value!.setNotifyValue(false);
    }
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await disableNotifications();
    await device.disconnect();
    log('Disconnected from ${device.remoteId}');
  }

  void clearData() {
    storageDataReceive.value = "";
    isFoundreadCharacteristic = false;
    isFoundwriteCharacteristic = false;
    writeCharacteristic = Rx<BluetoothCharacteristic?>(null);
    readCharacteristic = Rx<BluetoothCharacteristic?>(null);
    storageDataSend.clear();
    state.medDate.clear();
    state.medId.clear();
    state.medPass.clear();
    state.medTime.clear();
    state.medValue.clear();
  }

  // Send data to the connected device's characteristic
  Future<void> sendData() async {
    log('Sending data...' + writeCharacteristic.value.toString());
    if (writeCharacteristic.value != null) {
      log('Sending data...');
      String data = writeDataController.text;
      List<int> bytesToSend = data.codeUnits; // Convert text to bytes
      try {
        await writeCharacteristic.value!
            .write(bytesToSend); // Write the bytes to the characteristic
        log('Data sent: $data');
      } catch (e) {
        log('Error sending data: $e');
      }
    } else {
      log('No characteristic available to send data.');
    }
  }

  Future syncMedData(DateTime time, String typeId, String value, String unit,
      BuildContext context) async {
    // isLoading = true.obs;
    Get.dialog(const Center(child: CircularProgressIndicator()));

    var check = await FirebaseApi.checkExistDocumentForMed(
        'medicalData',
        'userId',
        state.profile.value?.id ?? '',
        'typeId',
        typeId,
        'time',
        Timestamp.fromDate(time));
    final data = MedicalEntity(
      userId: state.profile.value?.id,
      time: Timestamp.fromDate(time),
      typeId: typeId,
      value: value,
      unit: unit,
    );

    log(data.toString());
    await FirebaseApi.addDocument("medicalData", data.toFirestoreMap());
    // isLoading = false.obs;
    Get.back();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thành công'),
          content: const Text('Đã đồng bộ dữ liệu'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back(); // Dismiss the dialog
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  @override
  void onClose() {
    streamSubscription
        ?.cancel(); // Cancel the stream when the controller is disposed
    notificationSubscription?.cancel();
    super.onClose();
  }
}
