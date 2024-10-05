import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_for_all/common/entities/prescription.dart';

class Reminder {
  String? id;
  List<bool>? onDay;
  String? name;
  String? note;
  List<String>? measureMedId; // Assuming MedicalEntity is defined elsewhere
  List<String>? prescriptionId; // Assuming Prescription is defined as per your existing class
  String? time;
  String? date;

  Reminder({
    this.id,
    this.onDay,
    this.name,
    this.note,
    this.measureMedId,
    this.prescriptionId,
    this.time,
    this.date,
  });

  factory Reminder.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Reminder(
      id: snapshot.id,
      onDay: (data?['onDay'] as List<dynamic>?)
          ?.map((item) => item as bool)
          .toList(),
      name: data?['name'],
      note: data?['note'],
      time: data?['time'],
      date: data?['date'],
      measureMedId: (data?['measureMedId'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      prescriptionId: (data?['prescriptionId'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'onDay': onDay,
      'name': name,
      'note': note,
      'time': time,
      'date': date,
      'measureMedId': measureMedId,
      'prescriptionId': prescriptionId,
    };
  }

  @override
  String toString() {
    return 'Reminder{id: $id, onDay: $onDay, name: $name, note: $note, measureMedId: $measureMedId, prescriptionId: $prescriptionId, time: $time, date: $date}';
  }
}
