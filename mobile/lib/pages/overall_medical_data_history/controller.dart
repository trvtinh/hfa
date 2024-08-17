import 'dart:developer';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/API/item.dart';
import 'package:health_for_all/common/entities/medical_data.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/overall_medical_data_history/state.dart';
import 'package:health_for_all/pages/overall_medical_data_history/widget/combo_box.dart';

class OverallMedicalDataHistoryController extends GetxController {
  final state = OverrallMedicalDataHistoryState();
  final appController = Get.find<ApplicationController>();
  DateTime datetime = DateTime.now();
  RxString dateSelected = "".obs;
  Rx<DateTime> dateTimeSelected = DateTime.now().obs;
  RxMap<String, MedicalEntity> listEveryData = <String, MedicalEntity>{}.obs;
  static int length = 10;
  void updateLength() {
    length++;
  }

  Future<List<ComboBox>> getEntries() async {
    final futures = List.generate(length, (index) async {
      final MedicalEntity? data = await fetchLatestEventInDay(
          dateTimeSelected.value, Item.getTitle(index), 1);
      return ComboBox(
        leadingiconpath: Item.getIconPath(index),
        title: Item.getTitle(index),
        value: data?.value ?? '--',
        unit: Item.getUnit(index),
        time: data != null
            ? DatetimeChange.getHourString(data.time!.toDate())
            : '--',
      );
    });

    return await Future.wait(futures);
  }

  @override
  void onInit() {
    super.onInit();
    dateSelected.value = DateFormat('dd/MM/yyyy').format(DateTime.now());
    log(dateSelected.value);
    // fetchEventsInDay(DateTime(2024, 8, 14), 'Huyết áp', 1);
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchLastEventEveryData();

    ever(dateTimeSelected, (_) async {
      dateSelected.value =
          DateFormat('dd/MM/yyyy').format(dateTimeSelected.value);
    });

    ever(dateSelected, (_) {});
  }

  Future fetchLastEventEveryData() async {
    for (int i = 0; i <= 9; i++) {
      final data = await fetchLatestEvent(DateTime.now(), i.toString());
      if (data != null) {
        listEveryData[Item.getTitle(i)] = data;
      }
    }
    for (var i in listEveryData.keys) {
      log(i);
    }
    for (var i in listEveryData.values) {
      log(i.toString());
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate:
          dateTimeSelected.value, // Dùng dateTimeSelected thay vì datetime
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      datetime = selectedDate;
      final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      dateSelected.value = formattedDate;
      dateTimeSelected.value = selectedDate;
      await getEntries();
    }
  }

  Future<MedicalEntity?> fetchLatestEvent(DateTime date, String typeId) async {
    final db = FirebaseFirestore.instance;

    try {
      // Chuyển đổi DateTime thành Timestamp
      final time = Timestamp.fromDate(date);

      // Tìm tài liệu từ collection 'medicalData' với typeId và userId
      // Và lọc theo thời gian trong ngày
      final querySnapshot = await db
          .collection('medicalData')
          .where('typeId', isEqualTo: typeId)
          .where('userId',
              isEqualTo: appController.state.profile.value
                  ?.id) // Lọc tài liệu với 'time' >= startOfDay
          .where('time',
              isLessThanOrEqualTo: time) // Lọc tài liệu với 'time' <= endOfDay
          .orderBy('time', descending: true) // Sắp xếp theo 'time' giảm dần
          .limit(1) // Giới hạn kết quả để lấy tài liệu muộn nhất trong ngày
          .get();
      final documents = querySnapshot.docs;
      if (documents.isEmpty) {
        // Không tìm thấy tài liệu phù hợp trong ngày
        return null;
      }
      log(documents.first.toString());
      // Chuyển đổi dữ liệu tài liệu thành đối tượng MedicalEntity
      final data = MedicalEntity.fromFirestore(documents.first, null);
      log(data.toString());
      return data;
    } catch (e) {
      // Xử lý lỗi
      print('Error fetching latest event in day $date: $e');
      return null;
    }
  }

  Future<MedicalEntity?> fetchLatestEventInDay(
      DateTime date, String value, int? limit) async {
    final db = FirebaseFirestore.instance;

    try {
      // Xác định khoảng thời gian của ngày
      final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
      final endOfDay =
          DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

      // Chuyển đổi DateTime thành Timestamp
      final startTimestamp = Timestamp.fromDate(startOfDay);
      final endTimestamp = Timestamp.fromDate(endOfDay);

      // Lấy typeId từ Firestore bằng giá trị trường 'name'
      final query = await FirebaseApi.getQuerySnapshot(
          'type_medical_data', 'name', value);
      final docs = query.docs;
      if (docs.isEmpty) {
        // Không tìm thấy tài liệu với 'name' là specificValue
        return null;
      }

      final typeId = docs.first.id;
      // Tìm tài liệu từ collection 'medicalData' với typeId và userId
      // Và lọc theo thời gian trong ngày
      final querySnapshot = await db
          .collection('medicalData')
          .where('typeId', isEqualTo: typeId)
          .where('userId', isEqualTo: appController.state.profile.value?.id)
          .where('time',
              isGreaterThanOrEqualTo:
                  startTimestamp) // Lọc tài liệu với 'time' >= startOfDay
          .where('time',
              isLessThanOrEqualTo:
                  endTimestamp) // Lọc tài liệu với 'time' <= endOfDay
          .orderBy('time', descending: true) // Sắp xếp theo 'time' giảm dần
          .limit(limit ??
              1) // Giới hạn kết quả để lấy tài liệu muộn nhất trong ngày
          .get();
      final documents = querySnapshot.docs;
      if (documents.isEmpty) {
        // Không tìm thấy tài liệu phù hợp trong ngày
        return null;
      }
      log(documents.first.toString());
      // Chuyển đổi dữ liệu tài liệu thành đối tượng MedicalEntity
      final data = MedicalEntity.fromFirestore(documents.first, null);
      log(data.toString());
      return data;
    } catch (e) {
      // Xử lý lỗi
      print('Error fetching latest event in day $date: $e');
      return null;
    }
  }

  Future fetchEventsInDay(DateTime date, String value, int? limit) async {
    final db = FirebaseFirestore.instance;
    final List<MedicalEntity> data = [];
    try {
      // Xác định khoảng thời gian của ngày
      final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
      final endOfDay =
          DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

      // Chuyển đổi DateTime thành Timestamp
      final startTimestamp = Timestamp.fromDate(startOfDay);
      final endTimestamp = Timestamp.fromDate(endOfDay);

      // Lấy typeId từ Firestore bằng giá trị trường 'name'
      final query = await FirebaseApi.getQuerySnapshot(
          'type_medical_data', 'name', value);
      final docs = query.docs;

      if (docs.isEmpty) {
        // Không tìm thấy tài liệu với 'name' là specificValue
        return null;
      }

      final typeId = docs.first.id;

      // Tìm tài liệu từ collection 'medicalData' với typeId và userId
      // Và lọc theo thời gian trong ngày
      final querySnapshot = await db
          .collection('medicalData')
          .where('typeId', isEqualTo: typeId)
          .where('userId', isEqualTo: appController.state.profile.value?.id)
          .where('time',
              isGreaterThanOrEqualTo:
                  startTimestamp) // Lọc tài liệu với 'time' >= startOfDay
          .where('time',
              isLessThanOrEqualTo:
                  endTimestamp) // Lọc tài liệu với 'time' <= endOfDay
          .orderBy('time', descending: true) // Sắp xếp theo 'time' giảm dần
          .limit(limit ??
              1) // Giới hạn kết quả để lấy tài liệu muộn nhất trong ngày
          .get();

      final documents = querySnapshot.docs;

      if (documents.isEmpty) {
        // Không tìm thấy tài liệu phù hợp trong ngày
        return null;
      }

      // Chuyển đổi dữ liệu tài liệu thành đối tượng MedicalEntity
      for (final doc in documents) {
        data.add(MedicalEntity.fromFirestore(doc, null));
      }
      state.history[DatetimeChange.getDMYTime(date)] = data;
    } catch (e) {
      // Xử lý lỗi
      print('Error fetching event in day: $e');
      return null;
    }
  }

  Future fetchEventAmountTime(
      DateTime start, DateTime end, String value) async {
    for (int i = 0; i < DatetimeChange.getDuration(start, end); i++) {
      await fetchEventsInDay(start, value, 5);
      start = start.add(const Duration(days: 1));
    }
  }
}
