import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalDataState{
  RxString bloodPressureValue = "120/80".obs;
  Rx<TimeOfDay> timeofDay = TimeOfDay.now().obs;
}
