import 'package:get/get.dart';
import 'index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    // Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => PostController());
    // Get.lazyPut(()=> ProfileController());
    // Get.lazyPut(()=> TextWithImageController());
  }
}
