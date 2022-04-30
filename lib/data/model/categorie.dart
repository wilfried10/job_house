import 'dart:convert';

class Categorie {
  int idCat;
  String libellecat;
  Categorie({
    required this.idCat,
    required this.libellecat,
  });
  
  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'idCat': idCat});
    result.addAll({'libellecat': libellecat});
  
    return result;
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      idCat: map['idCat']?.toInt() ?? 0,
      libellecat: map['libellecat'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) => Categorie.fromMap(json.decode(source));
}
