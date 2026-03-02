// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModeltugas {
  final int? id;
  final String? name;
  final String email;
  final String? phone;
  final String city;
  final String password;
  UserModeltugas({
    this.name,
    this.id,
    required this.email,
    this.phone,
    required this.city,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
      'password': password,
    };
  }

  factory UserModeltugas.fromMap(Map<String, dynamic> map) {
    return UserModeltugas(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      city: map['city'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModeltugas.fromJson(String source) =>
      UserModeltugas.fromMap(json.decode(source) as Map<String, dynamic>);
}
