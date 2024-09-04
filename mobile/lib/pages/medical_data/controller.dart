import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/item.dart';
import 'package:health_for_all/pages/application/index.dart';
import 'package:health_for_all/pages/medical_data/state.dart';
import 'package:health_for_all/pages/medical_data/widget/combo_box.dart';
import 'package:intl/intl.dart';

class MedicalDataController extends GetxController {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final appController = Get.find<ApplicationController>();
  final state = MedicalDataState();
  static int length = 10;
  void updateLength() {
    length++;
  }

  @override
  void onInit() {
    super.onInit();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    timeController.text = DateFormat('hh:mm a')
        .format(DateTime.now()); // Use 'hh:mm a' for 12-hour format
  }

  final noteController = TextEditingController();
  final unitController = TextEditingController();
  final valueController = TextEditingController();
  DateTime datetime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  void clearController() {
    noteController.clear();
    unitController.clear();
    valueController.clear();
  }

  String formatTimeOfDay() {
    TimeOfDay timeOfDay = TimeOfDay.now();
    String formattedTime =
        "${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}";
    return formattedTime; // In ra thời gian dưới dạng chuỗi "hh:mm"
  }

  List<ComboBox> get entries => List.generate(length, (index) {
        log('index: $index');

        return ComboBox(
          time: formatTimeOfDay(),
          noteController: noteController,
          unitController: TextEditingController(text: Item.getUnit(index)),
          valueController: valueController,
          leadingiconpath: Item.getIconPath(index),
          title: Item.getTitle(index),
          value: valueController.text.obs,
          unit: Item.getUnit(index).obs,
        );
      });

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      datetime = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      dateController.text = formattedDate;
      updateTimestamp(); // Cập nhật timestamp
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );

    if (selectedTime != null) {
      timeOfDay = selectedTime;
      final formattedTime = selectedTime.format(context);
      timeController.text = formattedTime;
      updateTimestamp(); // Cập nhật timestamp
    }
  }

  Timestamp updateTimestamp() {
    final updatedDateTime = DateTime(
      datetime.year,
      datetime.month,
      datetime.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    final finalDateTime = updatedDateTime.copyWith(second: 0, millisecond: 0);

    // Định dạng DateTime thành chuỗi
    final formattedDateTime =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(finalDateTime);
    final dateTimestamp = Timestamp.fromDate(finalDateTime);
    // In ra hoặc làm gì đó với formattedDateTime
    return dateTimestamp;
  }

  Future<void> addMedicalData() async {}

  Future<String?> saveImageUrlToFirestore(String imageUrl) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('images').doc();
      await docRef.set({
        'url': imageUrl,
        'time': DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now()),
        'userID': appController.state.profile.value!.id,
      });
      print('Image URL saved to Firestore');
      return docRef.id; // Trả về ID của tài liệu
    } catch (e) {
      print('Error saving image URL to Firestore: $e');
      return null; // Trả về null nếu có lỗi
    }
  }
}
