import 'package:cloud_firestore/cloud_firestore.dart';

class Precription {
  String? id;
  List<String>? medicalIDs;
  String? assignId;
  String? patientId;
  String? name;
  String? note;
  Timestamp? startDate;
  Timestamp? endDate;
  List<String>? imageURL;
  List<Map<String, dynamic>>? medicineDatas;
  Precription({
    this.id,
    this.medicalIDs,
    this.assignId,
    this.patientId,
    this.name,
    this.note,
    this.startDate,
    this.endDate,
    this.imageURL,
    this.medicineDatas,
  });

  factory Precription.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Precription(
      id: data?['id'],
      patientId: data?['patientId'],
      assignId: data?['assignId'],
      name: data?['name'],
      note: data?['note'],
      startDate: data?['startDate'],
      endDate: data?['endDate'],
      imageURL: (data?['imageURL'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      medicineDatas: data?['medicineDatas'] != null
          ? List<Map<String, dynamic>>.from(data?['medicineDatas'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'assignId': assignId,
      'name': name,
      'note': note,
      'startDate': startDate,
      'endDate': endDate,
      'imageURL': imageURL,
      'medicineDatas': medicineDatas,
    };
  }

  @override
  String toString() {
    return 'Prescription{id: $id, medicalIDs: $medicalIDs, assignId: $assignId, patientId: $patientId, name: $name, note: $note, startDate: $startDate, endDate: $endDate, imageURL: $imageURL, medicineDatas: $medicineDatas}';
  }
}
