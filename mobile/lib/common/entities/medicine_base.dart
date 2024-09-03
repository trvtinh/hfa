import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineBase {
  String? id;
  String? name;
  String? description;
  List<String>? imageURL;

  MedicineBase({
    this.id,
    this.name,
    this.description,
    this.imageURL,
  });

  factory MedicineBase.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return MedicineBase(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      imageURL: (data?['imageURL'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageURL': imageURL,
    };
  }

  @override
  String toString() {
    return 'MedicineBase{id: $id, name: $name, description: $description, imageURL: $imageURL}';
  }
}
