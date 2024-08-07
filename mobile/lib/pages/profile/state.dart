import 'package:get/get.dart';
import 'package:health_for_all/common/entities/user.dart';

class ProfileState {
  var id = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = '123456789'.obs;
  var dateOfBirth = '01/01/2000'.obs;
  var gender = 'Nam'.obs;
  var head_detail = Rx<UserLoginResponseEntity?>(null);
  var profile = Rx<UserData?>(null);
  var searchResults = <Map<String, dynamic>>[].obs;
  var hasText = false.obs;
}
