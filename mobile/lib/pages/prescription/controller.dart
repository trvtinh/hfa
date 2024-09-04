import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/pages/prescription/state.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionController extends GetxController {
  PrescriptionController() {
    // Khởi tạo danh sách với 10 phần tử ban đầu, mỗi phần tử là một TextEditingController mới
    doseControllers = List<TextEditingController>.generate(
      10,
      (index) => TextEditingController(),
    ).obs;
  }
  final state = PrescriptionState();
  final RxList<XFile> selectedFiles = <XFile>[].obs;
  final RxList<String> selectedImagesURL = <String>[].obs;
  RxList<TextEditingController> doseControllers = <TextEditingController>[].obs;
  final nameController = TextEditingController();
  final noteController = TextEditingController();
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;

  Future<void> addImage() async {
    for (var value in selectedFiles) {
      final imageUrl =
          await FirebaseApi.uploadImage(value.path, 'prescription');
      selectedImagesURL.add(imageUrl!);
      log(selectedImagesURL.toString());
    }
  }

  // Future addMedicine() async {
  //   final data = Precription(
  //     name: nameController.text,
  //     note: noteController.text,
  //     imageURL: selectedImagesURL,
  //   );
  //   log(data.toString());
  //   await FirebaseApi.addDocument("medicines", data.toJson());
  // }

  Future addPrescription(
    String patientId,
    String doctorId,
    List<String> medicineIds,
    DateTime date,
  ) async {
    final data = {
      'patientId': patientId,
      'doctorId': doctorId,
      'medicineIds': medicineIds,
      'date': date.millisecondsSinceEpoch,
    };
    log(data.toString());
    await FirebaseApi.addDocument("prescriptions", data);
  }

  void clearData() {
    nameController.clear();
    noteController.clear();
    doseControllers.forEach((element) {
      element.clear();
    });
    selectedFiles.clear();
    selectedImagesURL.clear();
  }
}
