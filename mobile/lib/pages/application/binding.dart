import 'package:get/get.dart';
import 'package:health_for_all/pages/alarm/controller.dart';
import 'package:health_for_all/pages/chatbot/controller.dart';
import 'package:health_for_all/pages/choose_type_med/controller.dart';
import 'package:health_for_all/pages/connect_hardware/controller.dart';
import 'package:health_for_all/pages/diagnostic/controller.dart';
import 'package:health_for_all/pages/diagnostic_add/controller.dart';
import 'package:health_for_all/pages/following/controller.dart';
import 'package:health_for_all/pages/following_medical_data/controller.dart';
import 'package:health_for_all/pages/image_analyze/controller.dart';
import 'package:health_for_all/pages/medical_data/controller.dart';
import 'package:health_for_all/pages/notification/controller.dart';
import 'package:health_for_all/pages/overall_medical_data_history/controller.dart';
import 'package:health_for_all/pages/prescription/controller.dart';
import 'package:health_for_all/pages/profile/controller.dart';
import 'package:health_for_all/pages/profile/page/search_controller.dart';
import 'package:health_for_all/pages/reminder/controller.dart';
import 'index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SearchingController(), fenix: true);
    Get.lazyPut(() => MedicalDataController(), fenix: true);
    Get.lazyPut(() => OverallMedicalDataHistoryController(), fenix: true);
    Get.lazyPut(() => AlarmController(), fenix: true);
    Get.lazyPut(() => ChatbotController(), fenix: true);
    Get.lazyPut(() => PrescriptionController(), fenix: true);
    Get.lazyPut(() => ReminderController(), fenix: true);
    Get.lazyPut(() => ConnectHardwareController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => DiagnosticAddController(), fenix: true);
    Get.lazyPut(() => FollowingController(), fenix: true);
    Get.lazyPut(() => FollowingMedicalDataController(), fenix: true);
    Get.lazyPut(() => DiagnosticController(), fenix: true);
    Get.lazyPut(() => ChooseTypeMedController(), fenix: true);
    Get.lazyPut(() => ImageAnalyzeController(), fenix: true);

    // Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => PostController());
    // Get.lazyPut(()=> ProfileController());
    // Get.lazyPut(()=> TextWithImageController());
  }
}
