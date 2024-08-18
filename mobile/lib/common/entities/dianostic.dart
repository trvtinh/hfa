import 'package:cloud_firestore/cloud_firestore.dart';

class Dianostic {
  final String content;
  final String medicalId;
  final String userId;
  final Timestamp timestamp;
  List<String>? imagePaths;

  Dianostic({
    required this.content,
    required this.medicalId,
    required this.userId,
    required this.timestamp,
    this.imagePaths,
  });

  factory Dianostic.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Dianostic(
        content: data?['content'] as String? ?? '',
        medicalId: data?['medicalId'] as String? ?? '',
        userId: data?['userId'] as String? ?? '',
        imagePaths: (data?['imagePaths'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        timestamp: data?['time'] != null
            ? Timestamp.fromMillisecondsSinceEpoch(data?['time'])
            : Timestamp.now());
  }

  Map<String, dynamic> toFirestore() {
    return {
      'content': content,
      'medicalId': medicalId,
      'userId': userId,
      if (imagePaths != null) 'imagePaths': imagePaths,
      'time': timestamp.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return 'Dianostic(content: $content, medicalId: $medicalId, userId: $userId, imagePaths: $imagePaths, timestamp: $timestamp)';
  }
}
