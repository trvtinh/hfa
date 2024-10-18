import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/medical_data.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/samsung_connect/state.dart';
import 'package:carp_serializable/carp_serializable.dart';
import 'package:intl/intl.dart';

class SamsungConnectController extends GetxController {
  DateTime start = DateTime.now().add(Duration(hours: 1));
  DateTime end = DateTime.now().add(Duration(hours: 1));
  final state = SamsungConnectState();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  RxBool isLoading = false.obs;
  final appController = Get.find<ApplicationController>();

  Future<void> selectDateStart(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: start,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      start = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      startDateController.text = formattedDate;
    }
  }

  Future<void> selectDateEnd(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: start,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      end = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      endDateController.text = formattedDate;
    }
  }

  Future syncMedData(DateTime time, String typeId, String value, String unit,
      BuildContext context) async {
    // isLoading = true.obs;
    Get.dialog(const Center(child: CircularProgressIndicator()));

    // var check = await FirebaseApi.checkExistDocumentForMed(
    //     'medicalData',
    //     'userId',
    //     appController.state.profile.value?.id ?? '',
    //     'typeId',
    //     typeId,
    //     'time',
    //     Timestamp.fromDate(time));

    // if (check == true) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Lỗi'),
    //         content: const Text('Dữ liệu này đã được thêm từ trước'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Get.back();
    //               Get.back(); // Dismiss the dialog
    //             },
    //             child: const Text('Xác nhận'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // }

    // Create the Prescription object with valid data

    // print("dakmim1");
    // print(typeId);
    final data = MedicalEntity(
      userId: appController.state.profile.value?.id,
      time: Timestamp.fromDate(time),
      typeId: typeId,
      value: value,
      unit: unit,
    );

    log(data.toString());
    await FirebaseApi.addDocument("medicalData", data.toFirestoreMap());
    appController.getUpdatedLatestMedical();
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
}
