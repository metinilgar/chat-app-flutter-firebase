import 'dart:convert';

class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.photoUrl,
  });

  final String id;
  final String name;
  final String userName;
  final String email;
  final String? photoUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
