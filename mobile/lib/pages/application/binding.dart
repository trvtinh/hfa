import 'package:get/get.dart';
import 'package:health_for_all/pages/profile/controller.dart';
import 'index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => ProfileController(), fenix: true);
    // Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => PostController());
    // Get.lazyPut(()=> ProfileController());
    // Get.lazyPut(()=> TextWithImageController());
  }
}
