import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalEntity {
  String? id;
  String? typeId;
  String? time;
  String? value;
  List<String>? fireStoreIds;
  List<String>? commentIds;
  List<String>? dianoticIds;
  String? userId;

  MedicalEntity(
      {this.commentIds,
      this.userId,
      this.dianoticIds,
      this.fireStoreIds,
      this.id,
      this.time,
      this.typeId,
      this.value});

  @override
  String toString() {
    return 'MedicalEntity{id: $id, typeId: $typeId, time: $time, value: $value, fireStoreIds: $fireStoreIds, commentIds: $commentIds, dianoticIds: $dianoticIds, userId: $userId}';
  }

  factory MedicalEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return MedicalEntity(
      id: snapshot.id,
      typeId: data?['typeId'],
      time: data?['time'],
      value: data?['value'],
      fireStoreIds: data?['fireStoreIds'],
      commentIds: data?['commentIds'],
      dianoticIds: data?['dianoticIds'],
      userId: data?['userId'],
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      if (id != null) 'id': id,
      if (typeId != null) 'typeId': typeId,
      if (time != null) 'time': time,
      if (value != null) 'value': value,
      if (fireStoreIds != null) 'fireStoreIds': fireStoreIds,
      if (commentIds != null) 'commentIds': commentIds,
      if (dianoticIds != null) 'dianoticIds': dianoticIds,
      if (userId != null) 'userId': userId,
    };
  }
}
