import 'package:cloud_firestore/cloud_firestore.dart';

class Precription {
  String? id;
  List<String>? medicalIDs;
  String? doctorId;
  String? patientId;
  String? name;
  String? note;
  Timestamp? startDate;
  Timestamp? endDate;

  Precription({
    this.id,
    this.medicalIDs,
    this.doctorId,
    this.patientId,
    this.name,
    this.note,
    this.startDate,
    this.endDate,
  });

  factory Precription.fromJson(Map<String, dynamic> json) {
    return Precription(
      id: json['id'],
      patientId: json['patientId'],
      doctorId: json['doctorId'],
      name: json['name'],
      note: json['note'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'name': name,
      'note': note,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  @override
  String toString() {
    return 'Precription{id: $id, patientId: $patientId, doctorId: $doctorId, name: $name, note: $note, startDate: $startDate, endDate: $endDate}';
  }
}
