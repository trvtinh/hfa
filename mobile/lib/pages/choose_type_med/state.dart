import 'package:get/get.dart';
import 'package:health_for_all/common/entities/medicine_base.dart';

class ChooseTypeMedState {
  RxInt medicineCount = 0.obs;
  RxList<int> selectedMedicineIndex = <int>[].obs;
  RxList<MedicineBase> selectedMedicineBases = <MedicineBase>[].obs;
}
