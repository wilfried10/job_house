import 'dart:convert';

class Service {
  int idservice;
  String libelle;
  Service({
    required this.idservice,
    required this.libelle,
  });
  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'idservice': idservice});
    result.addAll({'libelle': libelle});
  
    return result;
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      idservice: map['idservice']?.toInt() ?? 0,
      libelle: map['libelle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) => Service.fromMap(json.decode(source));
}
