import 'package:cloud_firestore/cloud_firestore.dart';

class Diagnostic {
  String? id;
  String? content;
  Timestamp? timestamp;
  String? fromUId;
  String? toUId;
  List<String>? imageURL;
  String? medicalId;

  Diagnostic(
      {this.id,
      this.content,
      this.timestamp,
      this.fromUId,
      this.toUId,
      this.imageURL,
      this.medicalId});

  @override
  String toString() {
    return 'Diagnostic{id: $id, content: $content, timestamp: $timestamp, fromUId: $fromUId, toUId: $toUId, imageURL: $imageURL, medicalId: $medicalId}';
  }

  factory Diagnostic.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Diagnostic(
      id: snapshot.id,
      content: data?['content'] as String?,
      timestamp: data?['timestamp'] as Timestamp?,
      fromUId: data?['fromUId'] as String?,
      toUId: data?['toUId'] as String?,
      imageURL: (data?['imageURL'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'timestamp': timestamp,
      'fromUId': fromUId,
      'toUId': toUId,
      'imageURL': imageURL,
      'medicalId': medicalId,
    };
  }
}
