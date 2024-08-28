import 'package:get/get.dart';
import 'package:health_for_all/pages/chart/controller.dart';

class ChartBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => ChartController());
  }
}