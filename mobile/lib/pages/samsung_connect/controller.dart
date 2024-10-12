import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:health_for_all/pages/samsung_connect/state.dart';
import 'package:carp_serializable/carp_serializable.dart';
import 'package:intl/intl.dart';

class SamsungConnectController extends GetxController{
  DateTime start = DateTime.now().add(Duration(hours: 1));
  DateTime end = DateTime.now().add(Duration(hours: 1));
  final state = SamsungConnectState();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

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
}