import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/prescription.dart';

class ReminderController extends GetxController {
  final timeController = TextEditingController();
  final dueDateController = TextEditingController();
  List<bool> onDate = [
    false, false, false, false, false, false, false,
  ];
  List<String> nameDate = [
    "T2", "T3", "T4", "T5", "T6", "T7", "CN",
  ];
  final nameController = TextEditingController();
  final noteController = TextEditingController();
  RxList<Prescription> baseList = <Prescription>[].obs;
  RxList<Prescription> prescriptionList = <Prescription>[].obs;
  RxList<Prescription> selectedPrescriptions = <Prescription>[].obs;
  RxList<int> medDataList = <int>[].obs;
  RxList<int> selectedMedData = <int>[].obs;

  Future<void> initPrescriptions() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('prescriptions').get();
        baseList = snapshot.docs
            .map((doc) => Prescription.fromFirestore(doc))
            .toList().obs;
    } catch (e) {
      print("Error fetching prescriptions: $e");
    }
  }

  void fetchPrescriptions(){
    prescriptionList = baseList;
  }

  void fetchMedicalData(){
    medDataList = [0,1,2,3,4,5,6,7,8,9].obs;
  }

  void clearData(){
    nameController.clear();
    noteController.clear();
    timeController.clear();
    dueDateController.clear();
    selectedMedData.clear();
    selectedPrescriptions.clear();
    prescriptionList.clear();
    medDataList.clear();
    baseList.clear();
  }
}
