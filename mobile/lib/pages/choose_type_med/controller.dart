import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/medicine_base.dart';
import 'package:image_picker/image_picker.dart';

import 'state.dart';

class ChooseTypeMedController extends GetxController {
  final state = ChooseTypeMedState();
  final nameMedicine = TextEditingController();
  final description = TextEditingController();
  final RxList<XFile> selectedFiles = <XFile>[].obs;
  final RxList<String> selectedImagesURL = <String>[].obs;

  Future<void> addImage() async {
    for (var value in selectedFiles) {
      final imageUrl = await FirebaseApi.uploadImage(value.path, 'medicine');
      selectedImagesURL.add(imageUrl!);
      log(selectedImagesURL.toString());
    }
  }

  Future addMedicineBase() async {
    log("addMedicineBase");
    final name = nameMedicine.text;
    final desc = description.text;
    if (name.isEmpty) {
      Get.snackbar("Lỗi", "Điền đầy đủ thông tin", backgroundColor: Colors.red);
      return;
    }
    await addImage();
    final medicine = MedicineBase(
      name: name,
      description: desc,
      imageURL: selectedImagesURL,
    );
    log(medicine.toString());
    try {
      await FirebaseApi.addDocument("medicineBases", medicine.toJson());
      Get.snackbar("Thành công", "Thêm thuốc thành công",
          backgroundColor: Colors.green);
    } catch (e) {
      log(e.toString());
      Get.snackbar("Lỗi", "Có lỗi xảy ra khi thêm thuốc",
          backgroundColor: Colors.red);
    }
  }

  void clearData() {
    description.clear();
    nameMedicine.clear();
    selectedFiles.clear();
    selectedImagesURL.clear();
  }
}
