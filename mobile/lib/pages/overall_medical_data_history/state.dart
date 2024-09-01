import 'package:get/get.dart';
import 'package:health_for_all/common/entities/comment.dart';
import 'package:health_for_all/common/entities/dianostic.dart';
import 'package:health_for_all/common/entities/medical_data.dart';
import 'package:health_for_all/common/entities/user.dart';

class OverrallMedicalDataHistoryState {
  RxMap<DateTime, List<MedicalEntity>> history =
      <DateTime, List<MedicalEntity>>{}.obs;
  List<String> dataType = [];
  RxList<Comment> commmentList = <Comment>[].obs;
  RxList<Dianostic> diagnosticList = <Dianostic>[].obs;
  RxString medicalId = ''.obs;
  RxString selectedUserId = ''.obs;
  Rx<UserData> selectedUser = UserData().obs;
}
