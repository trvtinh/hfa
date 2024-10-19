import 'package:cloud_firestore/cloud_firestore.dart';

class EcgEntity {
  String? id;
  Timestamp? time;
  List<String>? value; // Changed from String? to List<String>?
  List<String>? commentIds;
  List<String>? dianoticIds;
  String? userId;
  String? unit;
  String? note;

  EcgEntity({
    this.commentIds,
    this.userId,
    this.dianoticIds,
    this.id,
    this.time,
    this.value, // Updated constructor
    this.unit,
    this.note,
  });

  @override
  String toString() {
    return 'MedicalEntity{id: $id, time: $time, value: $value, commentIds: $commentIds, dianoticIds: $dianoticIds, userId: $userId, unit : $unit, note: $note}';
  }

  factory EcgEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return EcgEntity(
      id: snapshot.id,
      time: data?['time'] as Timestamp?,
      value: (data?['value'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(), // Changed to handle List<String>
      commentIds: (data?['commentIds'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      dianoticIds: (data?['dianoticIds'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      userId: data?['userId'] as String?,
      unit: data?['unit'] as String?,
      note: data?['note'] as String?,
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      if (id != null) 'id': id,
      if (time != null) 'time': time,
      if (value != null) 'value': value, // Updated to store List<String>
      if (commentIds != null) 'commentIds': commentIds,
      if (dianoticIds != null) 'dianoticIds': dianoticIds,
      if (userId != null) 'userId': userId,
      if (unit != null) 'unit': unit,
      if (note != null) 'note': note,
    };
  }
}
