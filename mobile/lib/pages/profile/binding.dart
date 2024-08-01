import 'package:get/get.dart';

import 'controller.dart';
import 'widget/search_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<SearchingController>(() => SearchingController());
  }
}
