import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/medicine_base.dart';

import 'state.dart';

class ChooseTypeMedController extends GetxController {
  final state = ChooseTypeMedState();
  final nameMedicine = TextEditingController();
  final description = TextEditingController();

  Future addMedicineBase() async {
    final name = nameMedicine.text;
    final desc = description.text;
    if (name.isEmpty || desc.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    final medicine = MedicineBase(
      name: name,
      description: desc,
    );
    // await FirebaseApi.nameMedicine.clear();
    description.clear();
  }
}
