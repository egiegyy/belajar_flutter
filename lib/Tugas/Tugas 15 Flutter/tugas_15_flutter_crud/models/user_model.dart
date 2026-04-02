class UserModel {
  final int? id;
  final String name;
  final String email;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
  });

  UserModel copyWith({int? id, String? name, String? email}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final nestedUser = json['user'];
    if (nestedUser is Map<String, dynamic>) {
      return UserModel.fromJson(nestedUser);
    }

    final nestedData = json['data'];
    if (nestedData is Map<String, dynamic>) {
      return UserModel.fromJson(nestedData);
    }

    return UserModel(
      id: _parseInt(json['id']),
      name: '${json['name'] ?? json['nama'] ?? ''}',
      email: '${json['email'] ?? ''}',
    );
  }

  static int? _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is String) {
      return int.tryParse(value);
    }

    return null;
  }
}
