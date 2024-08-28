import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_for_all/common/helper/datetime_change.dart';
import 'package:health_for_all/pages/notification/controller.dart';
import 'package:health_for_all/pages/notification/widget/notification_item.dart';

class Unread extends StatelessWidget {
  Unread({super.key, required this.uid, required this.type});
  final String uid;
  final String type;
  final notiController = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('notifications')
                .where('uid', isEqualTo: uid)
                .where('type', isEqualTo: 'unread')
                .orderBy('time', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text('Không tìm thấy thông báo nào!!!'));
              }

              final notifications = snapshot.data!.docs;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                notiController.state.unread.value = notifications.length;
              });
              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];

                  return FutureBuilder<String>(
                    future: notiController.getNameByUId(notification['uid']),
                    builder: (context, nameSnapshot) {
                      if (nameSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final name = nameSnapshot.data ?? 'Unknown';

                      return Column(
                        children: [
                          NotificationItem(
                            name: name,
                            time: DatetimeChange.timestampToString(
                                notification['time'] as Timestamp),
                            content: notification['body'],
                            title: notification['title'],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        )
      ]),
    );
  }
}
