import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserProvider {
  CollectionReference userManager =
      FirebaseFirestore.instance.collection("user");

  Future<void> addUser(User value) async {
    try {
      await userManager
          .add(value.toMap())
          .then((value) => print(value))
          .catchError((e) => print(e));
    } catch (e) {
      // throw Exception("echec");
    }
  }

  Future<User> readUser() async {
    try {
      return await userManager
          .doc("Jr6vbssCL5p5zs0rac4o")
          .get()
          .then((value) => User.fromMap(value as Map<String, dynamic>));
    } catch (e) {
      throw Exception("echec");
    }
  }

  Future<void> deleteUser() async {}
  Future<void> updateUser() async {}
  Future<void> readUsers() async {}
}
