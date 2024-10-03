import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/prescription.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/choose_type_med/controller.dart';
import 'package:health_for_all/pages/prescription/state.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionController extends GetxController {
  final medicineController = Get.find<ChooseTypeMedController>();
  final state = PrescriptionState();
  final RxList<XFile> selectedFiles = <XFile>[].obs;
  final RxList<String> selectedImagesURL = <String>[].obs;
  RxList<TextEditingController> doseControllers = <TextEditingController>[].obs;
  final nameController = TextEditingController();
  final noteController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  RxList<String> medId = <String>[].obs;

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
  ) async {
    final data = Prescription(
    );
    log(data.toString());
    await FirebaseApi.addDocument("prescriptions", data.toJson());
  }

  void clearData() {
    nameController.clear();
    noteController.clear();
    startDateController.clear();
    endDateController.clear();
    for (var element in doseControllers) {
      element.clear();
    }
    selectedFiles.clear();
    selectedImagesURL.clear();
  }
}
