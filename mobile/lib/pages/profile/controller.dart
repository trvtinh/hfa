import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/common/store/user.dart';
import 'package:health_for_all/pages/profile/index.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      String profile = await UserStore.to.getProfile();

      if (profile.isNotEmpty) {
        UserLoginResponseEntity userdata =
            UserLoginResponseEntity.fromJson(jsonDecode(profile));
        state.head_detail.value = userdata;
        log('Dữ liệu local: ${state.head_detail.value.toString()}');

        final userCollection = FirebaseFirestore.instance.collection('users');
        final query = userCollection.where('id',
            isEqualTo: state.head_detail.value!.accessToken);

        final querySnapshot = await query.get();

        log('Query Snapshot: ${querySnapshot.toString()}');

        if (querySnapshot.docs.isNotEmpty) {
          final documentSnapshot = querySnapshot
              .docs.first; // Lấy tài liệu đầu tiên từ kết quả truy vấn
          state.profile.value = UserData.fromFirestore(documentSnapshot, null);
          log(state.profile.value.toString());
          // Thực hiện các thao tác khác với userData
        } else {
          log('User does not exist.');
        }
      } else {
        log("Lỗi lấy dữ liệu local");
      }
    } catch (e) {
      log('Lỗi khi lấy hồ sơ: $e');
    }
  }

  Future<void> updateUserDataById(String id, UserData userData) async {
    final db = FirebaseFirestore.instance;

    // Tìm document có trường id trùng với id truyền vào
    final querySnapshot =
        await db.collection("users").where('id', isEqualTo: id).get();

    if (querySnapshot.docs.isNotEmpty) {
      final docRef = querySnapshot.docs.first.reference;

      // Cập nhật dữ liệu
      await docRef.update(userData.toFirestore());
      print("User data updated successfully.");
    } else {
      print("User with the given id not found.");
    }
  }
}
