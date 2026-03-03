import 'dart:convert';

class ProgressModel {
  String name;
  String age;
  String weight;
  String height;
  ProgressModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
    };
  }

  factory ProgressModel.fromMap(Map<String, dynamic> map) {
    return ProgressModel(
      name: map['name'] as String,
      age: map['age'] as String,
      weight: map['weight'] as String,
      height: map['height'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgressModel.fromJson(String source) =>
      ProgressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
