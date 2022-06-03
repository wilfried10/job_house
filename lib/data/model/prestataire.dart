import 'dart:convert';

class Prestatair {
  final String nom;
  final String prenom;

  final String telephone;
  final String ville;
  final String profession;



  Prestatair( 
   this.nom, this.prenom, this.telephone, this.ville, 
       this.profession);
  


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'nom': nom});
    result.addAll({'prenom': prenom});
   
    result.addAll({'telephone': telephone});
    result.addAll({'ville': ville});
  
   
    
    result.addAll({'profession': profession});
  
    return result;
  }

  factory Prestatair.fromMap(Map<String, dynamic> map) {
    return Prestatair(
      map['nom'] ?? '',
      map['prenom'] ?? '',
    
      map['telephone'] ?? '',
      map['ville'] ?? '',
     
     
      
      map['profession'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Prestatair.fromJson(String source) => Prestatair.fromMap(json.decode(source));
}
