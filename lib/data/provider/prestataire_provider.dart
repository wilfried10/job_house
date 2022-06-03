import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/prestataire.dart';

class Prestataireprovider{
   CollectionReference prestataireManager = FirebaseFirestore.instance.collection("prestataire");
   Future <void> addPrestataire (
     Prestatair value
   )async{
   try {
     await prestataireManager.add(
     value.toMap()).then((value) => print(value)).catchError((e)=> print(e));
   }
    catch (e) {
      // throw Exception("echec");
   };

   }
}