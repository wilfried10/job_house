import 'dart:convert';

class Service {
  final String libelle;
   String? picture;
  final String description;
  final String budget;
  final String categorie;
  final String duree;

  Service( this.libelle, this.description,
      this.budget, this.categorie, this.duree,
      [this.picture]);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'libelle': libelle});
    result.addAll({'Picture': picture});
    result.addAll({'description': description});
    result.addAll({'budget': budget});
    result.addAll({'categorie': categorie});
    result.addAll({'duree': duree});

    return result;
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      map['libelle'] ?? '',
      map['picture'] ?? '',
      map['description'] ?? '',
      map['budget'] ?? '',
      map['categorie'] ?? '',
      map['duree']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));
}
