import 'dart:convert';

class Avis {
  final int idavis;
  final double note;
  final String commentaire;

  Avis(this.idavis, this.note, this.commentaire);


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'idavis': idavis});
    result.addAll({'note': note});
    result.addAll({'commentaire': commentaire});
  
    return result;
  }

  factory Avis.fromMap(Map<String, dynamic> map) {
    return Avis(
      map['idavis']?.toInt() ?? 0,
      map['note']?.toDouble() ?? 0.0,
      map['commentaire'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Avis.fromJson(String source) => Avis.fromMap(json.decode(source));
}
