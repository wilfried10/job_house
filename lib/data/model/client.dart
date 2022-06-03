import 'dart:convert';

class Client {
 final int idprest;
 final String nom;
 final String prenom;
 final String email;
 final int telephone;
 final String photo;
 final String vile;
  Client({
    required this.idprest,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.photo,
    required this.vile,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'idprest': idprest});
    result.addAll({'nom': nom});
    result.addAll({'prenom': prenom});
    result.addAll({'email': email});
    result.addAll({'telephone': telephone});
    result.addAll({'photo': photo});
    result.addAll({'vile': vile});
  
    return result;
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      idprest: map['idprest']?.toInt() ?? 0,
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      telephone: map['telephone']?.toInt() ?? 0,
      photo: map['password'] ?? '',
      vile: map['vile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}
