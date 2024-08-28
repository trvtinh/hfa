import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/notification_entity.dart';
import 'package:health_for_all/pages/application/controller.dart';
import 'package:health_for_all/pages/notification/state.dart';

class NotificationController extends GetxController {
  final state = NotificationState();
  final appController = Get.find<ApplicationController>();

  Future addNoti(
      String title, String body, String page, String type, String uid) async {
    final noti = NotificationEntity(
      title: title,
      body: body,
      page: page,
      type: type,
      time: Timestamp.now(),
      toUId: uid,
      fromUId: appController.state.profile.value!.id,
    );
    log(noti.toString());
    await FirebaseApi.addDocument(
      'notifications',
      noti.toMap(),
    );
  }

  Future<String> getNameByUId(String uid) async {
    final user = await FirebaseApi.getQuerySnapshot('users', 'id', uid);
    if (user.docs.isNotEmpty) {
      return user.docs.first['name'] as String;
    } else {
      return 'Unknown';
    }
  }

  Future<void> getNoti() async {
    final notiCollection =
        FirebaseFirestore.instance.collection('notifications').where(
              'to_uid',
              isEqualTo: appController.state.profile.value!.id,
            );
    final query = notiCollection.orderBy('time', descending: true);
    final querySnapshot = await query.get();
    if (querySnapshot.docs.isNotEmpty) {
      state.notiList.value = querySnapshot.docs
          .map((doc) => NotificationEntity.fromFirestore(doc))
          .toList();
    } else {
      log('No notification found.');
    }
  }
}
