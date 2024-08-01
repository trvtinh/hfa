import 'package:get/get.dart';
import 'package:health_for_all/pages/profile/widget/search_controller.dart';
import '../profile/controller.dart';
import 'index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(SearchingController());
    Get.lazyPut(() => ApplicationController());
    // Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => PostController());

    // Get.lazyPut(()=> TextWithImageController());
  }
}
