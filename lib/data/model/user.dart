import 'dart:convert';

class User {
  final String email;
  final String username;
  final String password;
  final String? profil;

  User(this.email, this.username, this.password, [this.profil]);

  bool get exists => false;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'username': username});
    result.addAll({'password': password});
    if (profil != null) {
      result.addAll({'profil': profil});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['email'] ?? '',
      map['username'] ?? '',
      map['password'] ?? '',
      map['profil'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  data() {}
}
