import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/request_follow.dart';
import 'package:health_for_all/common/entities/user.dart';
import 'package:health_for_all/common/entities/user_request.dart';
import 'package:health_for_all/common/store/user.dart';
import 'package:health_for_all/pages/profile/index.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  @override
  void onInit() async {
    super.onInit();
    await getProfile();
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

  Future<List<UserData>> fetchUserByIds(List<String> id) async {
    List<UserData> users = [];
    final db = FirebaseFirestore.instance;

    for (String userId in id) {
      final querySnapshot =
          await db.collection("users").where('id', isEqualTo: userId).get();
      if (querySnapshot.docs.isNotEmpty) {
        final docSnapshot = await querySnapshot.docs.first.reference.get();
        final userData = UserData.fromFirestore(docSnapshot, null);
        users.add(userData);
      }
    }
    return users;
  }

  Stream<List<UserData>> getUserByIds(List<String> id) async* {
    while (true) {
      yield await fetchUserByIds(id);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<List<UserRequest>> fetchRequest() async {
    List<UserRequest> requests = [];

    try {
      // Lấy danh sách các yêu cầu từ Firestore
      final querySnapshot = await FirebaseApi.getQuerySnapshot(
          'requestFollows', 'toUId', state.profile.value!.id!);

      // Lưu danh sách các Future<UserRequest>
      final List<Future<UserRequest>> requestFutures = [];

      for (var doc in querySnapshot.docs) {
        final data = RequestFollow.fromFirestore(doc, null);

        // Thực hiện truy vấn để lấy profile người dùng
        final profileFuture =
            FirebaseApi.getQuerySnapshot('users', 'id', data.fromUId!);

        // Tạo Future<UserRequest> cho mỗi tài liệu
        requestFutures.add(profileFuture.then((queryProfile) {
          // Kiểm tra xem có ít nhất một tài liệu không
          if (queryProfile.docs.isNotEmpty) {
            final request = UserRequest.fromFirestore(
                queryProfile.docs.first, null, data.typeRole!, doc.id);
            return request;
          } else {
            throw Exception('User profile not found for ${data.fromUId}');
          }
        }));
      }

      // Đợi tất cả các Future<UserRequest> hoàn thành
      requests = await Future.wait(requestFutures);
    } catch (e) {
      print('Error fetching requests: $e');
    }
    for (var i in requests) {
      print("name: " + i.user!.name.toString() + 'role : ' + i.role.toString());
    }
    return requests;
  }

  Stream<List<UserRequest>> getRequest() async* {
    while (true) {
      yield await fetchRequest();
      await Future.delayed(const Duration(seconds: 1));
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

  Future sendRequest(String id, String type) async {
    log('send request');
    final db = FirebaseFirestore.instance;
    final userbase = await db
        .collection("requestFollows")
        .withConverter(
          fromFirestore: UserData.fromFirestore,
          toFirestore: (UserData userdata, options) => userdata.toFirestore(),
        )
        .where("from_uid", isEqualTo: state.profile.value!.id)
        .where("to_uid", isEqualTo: id)
        .where('typeRole', isEqualTo: type)
        .get();

    if (userbase.docs.isEmpty) {
      final data = RequestFollow(
        fromUId: state.profile.value!.id,
        toUId: id,
        typeRole: type,
      );
      log(data.toString());

      await db
          .collection('requestFollows')
          .withConverter(
            fromFirestore: RequestFollow.fromFirestore,
            toFirestore: (RequestFollow request, options) =>
                request.toFirestore(),
          )
          .add(data);
      log('send request successfully');
      Get.back();
    }
  }
}
