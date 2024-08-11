import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/medical_data.dart';

class MedicalDataState {
  Rx<TimeOfDay> timeofDay = TimeOfDay.now().obs;
  Map<String, MedicalEntity> data = <String, MedicalEntity>{};
}