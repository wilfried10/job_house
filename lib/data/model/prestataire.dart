import 'dart:convert';

class Prestataire {
  int idprest;
  String nom;
  String prenom;
  String email;
  int telephone;
  String password;
  String vile;
 Prestataire({
    required this.idprest,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.password,
    required this.vile,
  });
  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'idprest': idprest});
    result.addAll({'nom': nom});
    result.addAll({'prenom': prenom});
    result.addAll({'email': email});
    result.addAll({'telephone': telephone});
    result.addAll({'password': password});
    result.addAll({'vile': vile});
  
    return result;
  }

  factory Prestataire.fromMap(Map<String, dynamic> map) {
    return Prestataire(
      idprest: map['idprest']?.toInt() ?? 0,
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      telephone: map['telephone']?.toInt() ?? 0,
      password: map['password'] ?? '',
      vile: map['vile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Prestataire.fromJson(String source) => Prestataire.fromMap(json.decode(source));
}
