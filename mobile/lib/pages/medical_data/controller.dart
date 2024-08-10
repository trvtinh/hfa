import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/pages/application/index.dart';
import 'package:intl/intl.dart';

class MedicalDataController extends GetxController {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final appController = Get.find<ApplicationController>();
  DateTime datetime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

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
      _updateTimestamp(); // Cập nhật timestamp
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
      _updateTimestamp(); // Cập nhật timestamp
    }
  }

  void _updateTimestamp() {
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

    // In ra hoặc làm gì đó với formattedDateTime
    print('Formatted DateTime: $formattedDateTime');
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
