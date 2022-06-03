import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';
import 'package:job_house/data/model/user.dart';

class Myheader extends StatefulWidget {
  const Myheader({Key? key}) : super(key: key);

  @override
  State<Myheader> createState() => _MyheaderState();
}

class _MyheaderState extends State<Myheader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: scrolPassage,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return const Text("chargement");
            }
            UserModel data = UserModel.fromMap(snapshot.data!.data()!);
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 70,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("asset/img/gagne.jpg")))),
                  Text(data.username,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(
                    data.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ]);
          }),
    );
  }
}
