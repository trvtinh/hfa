import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/API/item.dart';
import 'package:health_for_all/common/entities/diagnostic.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/diagnostic_add/information.dart';
import 'package:health_for_all/pages/diagnostic_add/widget/data_box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DiagnosticAddController extends GetxController {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final noteController = TextEditingController();
  final unitController = TextEditingController();
  final valueController = TextEditingController();
  final appController = Get.find<ApplicationController>();
  final RxList<XFile> selectedFiles = <XFile>[].obs;
  final RxList<String> selectedImagesURL = <String>[].obs;
  static int length = 5;

  Future addDiagnostic(String medicalId, String toUId) async {
    final data = Diagnostic(
      content: noteController.text,
      timestamp: Timestamp.fromDate(DateTime.now()),
      fromUId: appController.state.profile.value!.id!,
      toUId: toUId,
      medicalId: medicalId,
      imageURL: selectedImagesURL,
    );
    final docId = await FirebaseApi.addDocument('diagnostic', data.toMap());
    return docId;
  }

  Future<void> addImage() async {
    for (var value in selectedFiles) {
      final imageUrl = await FirebaseApi.uploadImage(value.path, 'diagnostic');
      selectedImagesURL.add(imageUrl!);
      log(value.toString());
      log(selectedImagesURL.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  DateTime datetime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  String formatTimeOfDay() {
    TimeOfDay timeOfDay = TimeOfDay.now();
    String formattedTime =
        "${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}";
    return formattedTime; // In ra thời gian dưới dạng chuỗi "hh:mm"
  }

  List<DataBox> get entries => List.generate(length, (index) {
        return DataBox(
          time: formatTimeOfDay(),
          noteController: noteController,
          leadingiconpath: Item.getIconPath(ind[index]),
          title: Item.getTitle(ind[index]),
          value: Item.getUnit(ind[index]),
          unit: Item.getUnit(ind[index]),
          pos: index,
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
}


 // List<ViewDataBox> get listview => List.generate(view.length, (index) {
  //       return ViewDataBox(
  //         time: formatTimeOfDay(),
  //         noteController: noteController,
  //         leadingiconpath: Item.getIconPath(view[index]),
  //         title: Item.getTitle(view[index]),
  //         value: Item.getUnit(view[index]),
  //         unit: Item.getUnit(view[index]),
  //       );
  //     });