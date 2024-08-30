class MedicineBase {
  String? id;
  String? name;
  String? description;

  MedicineBase({
    this.id,
    this.name,
    this.description,
  });

  factory MedicineBase.fromJson(Map<String, dynamic> json) {
    return MedicineBase(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'MedicineBase{id: $id, name: $name, description: $description}';
  }
}
