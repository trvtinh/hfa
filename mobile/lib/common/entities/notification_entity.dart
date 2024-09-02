import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationEntity {
  String? title;
  String? body;
  String? type;
  String? id;
  Timestamp? time;
  String? page;
  String? toUId;
  String? fromUId;
  String? status;

  NotificationEntity({
    this.title,
    this.body,
    this.type,
    this.id,
    this.time,
    this.page,
    this.toUId,
    this.fromUId,
    this.status,
  });

  @override
  String toString() {
    return 'NotificationEntity{title: $title, body: $body, type: $type, id: $id, time: $time, page: $page, uid: $toUId}';
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'type': type,
      'id': id,
      'time': time,
      'page': page,
      'to_uid': toUId,
      'from_uid': fromUId,
      'status': status,
    };
  }

  factory NotificationEntity.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return NotificationEntity(
      title: data['title'],
      body: data['body'],
      type: data['type'],
      id: doc.id,
      time: data['time'],
      page: data['page'],
      toUId: data['to_uid'],
      fromUId: data['from_uid'],
      status: data['status'],
    );
  }
}
