import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/medicine_base.dart';
import 'package:intl/intl.dart';

class PrescriptionController extends GetxController {
  PrescriptionController();

  Future addMedicineBase(String name, String description) async {
    final data = MedicineBase(name: name, description: description);
    log(data.toString());
    await FirebaseApi.addDocument("medicineBases", data.toJson());
  }

  Future addMedicine(
    String id,
    String name,
    String description,
    int quantity,
    DateTime timeDrinking,
    String unit,
  ) async {
    final data = {
      'name': name,
      'description': description,
      'quantity': quantity,
      'timeDrinking': timeDrinking.millisecondsSinceEpoch,
      'unit': unit,
      'medicineBaseId': id,
    };
    log(data.toString());
    await FirebaseApi.addDocument("medicines", data);
  }

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
}
