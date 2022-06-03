import 'package:flutter/material.dart';

import '../constantes.dart';
import '../widget/customs_buttom.dart';

class Besoin extends StatefulWidget {
  const Besoin({Key? key}) : super(key: key);

  @override
  State<Besoin> createState() => _BesoinState();
}

class _BesoinState extends State<Besoin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();

  final TextEditingController telephone = TextEditingController();
  final TextEditingController ville = TextEditingController();

  final TextEditingController profession = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mon besoin"),
          backgroundColor: scrolPassage,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: fontCouleur,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: const Text('De quoi ai je besoin??')),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        // controller: nom,
                        decoration: InputDecoration(
                            hintText: "Entrez une categorie",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez une categorie';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        // controller: prenom,
                        decoration: InputDecoration(
                            hintText: "Entrez une description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez une description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        // controller: telephone,
                        decoration: InputDecoration(
                            hintText: "Entrez votre budget ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'entrez votre budget';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        // controller: telephone,
                        decoration: InputDecoration(
                            hintText: "Entrez la duree ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'entrez la duree';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          primary: true,
                          name: 'Chercher',
                          ontap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => const SingUp()));
                          }),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
