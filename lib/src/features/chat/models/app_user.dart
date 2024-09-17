import 'dart:convert';

class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.photourl,
  });

  final String id;
  final String name;
  final String username;
  final String email;
  final String photourl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'photourl': photourl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      photourl: map['photourl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  AppUser copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    String? photourl,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      photourl: photourl ?? this.photourl,
    );
  }
}
