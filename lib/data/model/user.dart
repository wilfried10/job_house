import 'dart:convert';

class UserModel {
  final String email;
  final String username;
  final String password;
  final String? profil;

  UserModel(this.email, this.username, this.password, [this.profil]);

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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['email'] ?? '',
      map['username'] ?? '',
      map['password'] ?? '',
      map['profil'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  data() {}
}
