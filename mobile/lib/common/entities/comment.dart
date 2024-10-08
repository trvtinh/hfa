import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String? id; // Made this optional to match Prescription
  String? uid;
  String? content;
  Timestamp? time; // Made this optional
  String? medicalId;

  Comment({
    this.id,
    this.uid,
    this.content,
    this.time,
    this.medicalId,
  });

  factory Comment.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Comment(
      id: snapshot.id,
      uid: data?['uid'] as String?,
      content: data?['content'] as String?,
      time: data?['time'] != null
          ? Timestamp.fromMillisecondsSinceEpoch(data?['time'])
          : null,
      medicalId: data?['medicalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'content': content,
      'time': time?.millisecondsSinceEpoch,
      'medicalId': medicalId,
    };
  }

  @override
  String toString() {
    return 'Comment{id: $id, uid: $uid, content: $content, time: $time, medicalId: $medicalId}';
  }
}
