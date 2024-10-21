import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmEntity {
  String? id;
  String? typeId;
  Timestamp? time;
  String? highThreshold;
  String? lowThreshold;
  // String? userId;
  String? fromUId;
  String? toUId;
  bool? enable;

  AlarmEntity(
      {this.id,
      this.typeId,
      this.time,
      this.highThreshold,
      this.lowThreshold,
      this.fromUId,
      this.toUId,
      // this.userId,
      this.enable});

  @override
  String toString() {
    return 'AlarmEntity{id: $id, typeId: $typeId, time: $time, highThreshold: $highThreshold, lowThreshold: $lowThreshold, fromUId: $fromUId, toUId: $toUId, enable: $enable}';
  }

  factory AlarmEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return AlarmEntity(
      id: snapshot.id,
      typeId: data?['typeId'] as String?,
      time: data?['time'] as Timestamp?,
      highThreshold: data?['highThreshold'] as String?,
      lowThreshold: data?['lowThreshold'] as String?,
      fromUId: data?['fromUId'] as String?,
      toUId: data?['toUId'] as String?,
      enable: data?['enable'] as bool?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'typeId': typeId,
      'time': time,
      'highThreshold': highThreshold,
      'lowThreshold': lowThreshold,
      'fromUId': fromUId,
      'toUId': toUId,
      'enable': enable,
    };
  }
}
