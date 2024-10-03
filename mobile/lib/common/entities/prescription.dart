import 'package:cloud_firestore/cloud_firestore.dart';

class Prescription {
  String? id;
  List<String>? medicalIDs;
  String? assignId;
  String? patientId;
  String? name;
  String? note;
  Timestamp? startDate;
  Timestamp? endDate;
  List<String>? imageURL;
  List<String>? medicineDose;
  Prescription({
    this.id,
    this.medicalIDs,
    this.assignId,
    this.patientId,
    this.name,
    this.note,
    this.startDate,
    this.endDate,
    this.imageURL,
    this.medicineDose,
  });

  factory Prescription.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Prescription(
      id: snapshot.id,
      patientId: data?['patientId'],
      assignId: data?['assignId'],
      name: data?['name'],
      note: data?['note'],
      startDate: data?['startDate'],
      endDate: data?['endDate'],
      imageURL: (data?['imageURL'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      medicineDose: data?['medicineDose'] != null
          ? List<String>.from(data?['medicineDose'])
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
      'medicineDatas': medicineDose,
    };
  }

  @override
  String toString() {
    return 'Prescription{id: $id, medicalIDs: $medicalIDs, assignId: $assignId, patientId: $patientId, name: $name, note: $note, startDate: $startDate, endDate: $endDate, imageURL: $imageURL, medicineDatas: $medicineDatas}';
  }
}
