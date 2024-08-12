import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalEntity {
  String? id;
  String? typeId;
  Timestamp? time;
  String? value;
  List<String>? imageUrls;
  List<String>? commentIds;
  List<String>? dianoticIds;
  String? userId;
  String? unit;
  String? note;
  List<String>? imagePaths;

  MedicalEntity(
      {this.commentIds,
      this.userId,
      this.dianoticIds,
      this.imageUrls,
      this.id,
      this.time,
      this.typeId,
      this.value,
      this.unit,
      this.note,
      this.imagePaths});

  @override
  String toString() {
    return 'MedicalEntity{id: $id, typeId: $typeId, time: $time, value: $value, imageUrls: $imageUrls, commentIds: $commentIds, dianoticIds: $dianoticIds, userId: $userId, unit : $unit, note: $note, image: $imagePaths}';
  }

  factory MedicalEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return MedicalEntity(
      id: snapshot.id,
      typeId: data?['typeId'],
      time: data?['time'] as Timestamp,
      value: data?['value'],
      imageUrls: data?['imageUrls'],
      commentIds: data?['commentIds'],
      dianoticIds: data?['dianoticIds'],
      userId: data?['userId'],
      unit: data?['unit'],
      note: data?['note'],
      imagePaths: data?['imagePaths'],
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      if (id != null) 'id': id,
      if (typeId != null) 'typeId': typeId,
      if (time != null) 'time': time,
      if (value != null) 'value': value,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (commentIds != null) 'commentIds': commentIds,
      if (dianoticIds != null) 'dianoticIds': dianoticIds,
      if (userId != null) 'userId': userId,
      if (unit != null) 'unit': unit,
      if (note != null) 'note': note,
      if (imagePaths != null) 'imagePaths': imagePaths,
    };
  }
}
