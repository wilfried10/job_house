import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserProvider {
  CollectionReference userManager =
      FirebaseFirestore.instance.collection("user");

  Future<void> addUser(UserModel value) async {
    try {
      await userManager
          .add(value.toMap())
          .then((value) => print(value))
          .catchError((e) => print(e));
    } catch (e) {
      // throw Exception("echec");
    }
  }

  Future<void> addUserByDoc(String docId, UserModel value) async {
    try {
      await userManager.doc(docId).set(value.toMap());
    } catch (e) {
      // throw Exception("echec");
    }
  }

  Future<UserModel> readUser() async {
    try {
      return await userManager
          .doc("Jr6vbssCL5p5zs0rac4o")
          .get()
          .then((value) => UserModel.fromMap(value as Map<String, dynamic>));
    } catch (e) {
      throw Exception("echec");
    }
  }

  Future<void> deleteUser() async {}
  Future<void> updateUser() async {}
  Future<void> readUsers() async {}
}
