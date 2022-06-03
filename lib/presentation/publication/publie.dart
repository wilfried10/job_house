import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';
import 'package:job_house/widget/customs_buttom.dart';

import '../../data/model/service.dart';
import '../../data/provider/service_provider.dart';
import '../../services/shared_pref.dart';
import '../etape3.dart';

class Publie extends StatefulWidget {
  const Publie({Key? key}) : super(key: key);

  @override
  State<Publie> createState() => _PublieState();
}

class _PublieState extends State<Publie> {
  final _formKey = GlobalKey<FormState>();

 final ServiceProvider serviceManager = ServiceProvider();
  final TextEditingController libelle = TextEditingController();
  final TextEditingController budget = TextEditingController();

  final TextEditingController duree = TextEditingController();
  final TextEditingController categorie = TextEditingController();

  final TextEditingController picture = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Publier un service"),
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
                            Center(child: Text('Publier un service ')),
                            const SizedBox(
                              height: 19,
                            ),
                            TextFormField(
                              controller: libelle,
                              decoration: InputDecoration(
                                  hintText: "Nom du service",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nom du service';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            TextFormField(
                              controller: budget,
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
                              controller: duree,
                              decoration: InputDecoration(
                                  hintText: "Le nombre de jour ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Le nombre de jour';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            TextFormField(
                              controller: categorie,
                              decoration: InputDecoration(
                                  hintText: "Entrer une categorie",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrer une categorie';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            TextFormField(
                              controller: description,
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
                            const SizedBox(
                              height: 24,
                            ),
                           CustomButton(
                              name: "Publier",
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    serviceManager
                                        .addService(Service(
                                            libelle.text.trim(),
                                            budget.text.trim(),
                                            duree.text.trim(),
                                            categorie.text.trim(),
                                          description.text.trim(),
                                            ))
                                        .then((value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const Abonement()));
                                    });
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Une erreur est survenue')),
                                    );
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}
