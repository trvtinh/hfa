import 'package:get/get.dart';
import 'package:health_for_all/common/entities/comment.dart';
import 'package:health_for_all/common/entities/medical_data.dart';

class OverrallMedicalDataHistoryState {
  RxMap<DateTime, List<MedicalEntity>> history =
      <DateTime, List<MedicalEntity>>{}.obs;
  List<String> dataType = [];
  RxList<Comment> commmentList = <Comment>[].obs;
  RxString medicalId = ''.obs;
}
