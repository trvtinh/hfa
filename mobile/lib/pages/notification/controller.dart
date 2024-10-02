import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/common/entities/notification_entity.dart';
import 'package:health_for_all/pages/notification/state.dart';

class NotificationController extends GetxController {
  final state = NotificationState();

  Future<void> fetchNotificationCounts() async {
    final uid = state.profile.value!.id;

    // Fetch unread notifications count
    final unreadCount = await FirebaseFirestore.instance
        .collection('notifications')
        .where('to_uid', isEqualTo: uid)
        .where('status', isEqualTo: 'unread')
        .get()
        .then((snapshot) => snapshot.docs.length);
    state.unread.value = unreadCount;

    // Fetch read notifications count
    final readCount = await FirebaseFirestore.instance
        .collection('notifications')
        .where('to_uid', isEqualTo: uid)
        .where('status', isEqualTo: 'read')
        .get()
        .then((snapshot) => snapshot.docs.length);
    state.read.value = readCount;

    // Fetch warning notifications count
    final warningCount = await FirebaseFirestore.instance
        .collection('notifications')
        .where('to_uid', isEqualTo: uid)
        .where('status', isEqualTo: 'warning')
        .get()
        .then((snapshot) => snapshot.docs.length);
    state.warning.value = warningCount;

    // Fetch reminder notifications count
    final reminderCount = await FirebaseFirestore.instance
        .collection('notifications')
        .where('to_uid', isEqualTo: uid)
        .where('status', isEqualTo: 'reminder')
        .get()
        .then((snapshot) => snapshot.docs.length);
    state.reminder.value = reminderCount;

    log('Unread: ${state.unread.value}, Read: ${state.read.value}, Warning: ${state.warning.value}, Reminder: ${state.reminder.value}');
  }

  Future addNoti(String title, String body, String page, String type,
      String uid, String status,
      {String? diagnosticId, String? medicalId}) async {
    final noti = NotificationEntity(
        title: title,
        body: body,
        page: page,
        type: type,
        time: Timestamp.now(),
        toUId: uid,
        fromUId: state.profile.value!.id,
        status: status,
        diagnosticId: diagnosticId ?? "",
        medicalId: medicalId ?? "");
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
              isEqualTo: state.profile.value!.id,
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
