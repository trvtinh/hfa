import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/alarm_entity.dart';

import 'state.dart';

class AlarmController extends GetxController {
  final state = AlarmState();
  AlarmController();
  RxString seletedTypeId = ''.obs;
  final unitController = TextEditingController();
  final highThresholdController = TextEditingController();
  final lowThresholdController = TextEditingController();
  RxInt numberAlarm = 0.obs;

  Future addAlarm(BuildContext context) async {
    final unit = unitController.text;
    final highThreshold = highThresholdController.text;
    final lowThreshold = lowThresholdController.text;
    if (unit.isEmpty || highThreshold.isEmpty || lowThreshold.isEmpty) {
      Get.snackbar("Lỗi", "Vui lòng điền đầy đủ thông tin",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }
    final alarm = AlarmEntity(
      userId: state.profile.value!.id,
      time: Timestamp.fromDate(DateTime.now()),
      highThreshold: highThreshold,
      lowThreshold: lowThreshold,
      typeId: seletedTypeId.value,
      enable: true,
    );
    try {
      await FirebaseApi.addDocument('alarms', alarm.toMap());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thành công'),
            content: const Text('Thêm cảnh báo thành công.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate back after dialog is closed
                  Get.back();
                },
              ),
            ],
          );
        },
      );
      unitController.clear();
      highThresholdController.clear();
      lowThresholdController.clear();
    } catch (e) {
      Get.snackbar("Lỗi", "Thêm cảnh báo thất bại",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      log(e.toString());
    }
  }

  void clearData() {
    unitController.clear();
    highThresholdController.clear();
    lowThresholdController.clear();
  }

  Future getAlarmCount() async {
    final uid = state.profile.value!.id;
    final alarmCount = await FirebaseFirestore.instance
        .collection('alarms')
        .where('userId', isEqualTo: uid)
        .get()
        .then((snapshot) => snapshot.docs.length);
    numberAlarm.value = alarmCount;
  }

  Future changeEnable(String id, bool value) async {
    try {
      await FirebaseFirestore.instance
          .collection('alarms')
          .doc(id)
          .update({'enable': value});
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteAlarm(String id) async {
    try {
      await FirebaseFirestore.instance.collection('alarms').doc(id).delete();
      Get.back();
      clearData();
    } catch (e) {
      log(e.toString());
    }
  }

  Future editAlarm(String id) async {
    final unit = unitController.text;
    final highThreshold = highThresholdController.text;
    final lowThreshold = lowThresholdController.text;
    if (unit.isEmpty || highThreshold.isEmpty || lowThreshold.isEmpty) {
      Get.snackbar("Lỗi", "Vui lòng điền đầy đủ thông tin",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }
    final alarm = AlarmEntity(
      userId: state.profile.value!.id,
      time: Timestamp.fromDate(DateTime.now()),
      highThreshold: highThreshold,
      lowThreshold: lowThreshold,
      typeId: seletedTypeId.value,
      enable: true,
    );
    try {
      await FirebaseFirestore.instance
          .collection('alarms')
          .doc(id)
          .update(alarm.toMap());
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thành công'),
            content: const Text('Sửa cảnh báo thành công.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate back after dialog is closed
                  Get.back();
                },
              ),
            ],
          );
        },
      );
      unitController.clear();
      highThresholdController.clear();
      lowThresholdController.clear();
    } catch (e) {
      Get.snackbar("Lỗi", "Sửa cảnh báo thất bại",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      log(e.toString());
    }
  }
}
