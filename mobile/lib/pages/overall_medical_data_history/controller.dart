import 'package:cloud_firestore/cloud_firestore.dart';
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
  static int length = 10;
  void updateLength() {
    length++;
  }

  Future<List<ComboBox>> getEntries() async {
    final futures = List.generate(length, (index) async {
      final MedicalEntity? data = await fetchLatestEventInDay(
          DateTime(2024, 8, 12), Item.getTitle(index), 1);
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

      // Chuyển đổi dữ liệu tài liệu thành đối tượng MedicalEntity
      final data = MedicalEntity.fromFirestore(documents.first, null);
      return data;
    } catch (e) {
      // Xử lý lỗi
      print('Error fetching latest event in day: $e');
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
      print('Error fetching latest event in day: $e');
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
