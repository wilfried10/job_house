import 'dart:convert';

class ModePaiment {
  int idmdp;
  String libelle;
  ModePaiment({
    required this.idmdp,
    required this.libelle,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'idmdp': idmdp});
    result.addAll({'libelle': libelle});
  
    return result;
  }

  factory ModePaiment.fromMap(Map<String, dynamic> map) {
    return ModePaiment(
      idmdp: map['idmdp']?.toInt() ?? 0,
      libelle: map['libelle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModePaiment.fromJson(String source) => ModePaiment.fromMap(json.decode(source));
}
