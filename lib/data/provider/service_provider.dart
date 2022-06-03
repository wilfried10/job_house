import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/service.dart';

class ServiceProvider {
  CollectionReference serviceManager = FirebaseFirestore.instance.collection("service");
    
  Future<void> addService(Service value) async {
    try {
      await serviceManager
          .add(value.toMap())
          .then((value) => print(value))
          .catchError((e) => print(e));
    } catch (e) {
      throw Exception("echec");
    }
  }
}