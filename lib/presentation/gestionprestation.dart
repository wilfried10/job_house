import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';

import '../data/model/prestataire.dart';
import '../data/provider/prestataire_provider.dart';
import '../services/shared_pref.dart';
import '../widget/customs_buttom.dart';
import 'etape3.dart';

class GestionPrestation extends StatefulWidget {
  const GestionPrestation({Key? key}) : super(key: key);

  @override
  State<GestionPrestation> createState() => _GestionPrestationState();
}

class _GestionPrestationState extends State<GestionPrestation> {
  final _formKey = GlobalKey<FormState>();

  final Prestataireprovider prestataireManager = Prestataireprovider();

  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();

  final TextEditingController telephone = TextEditingController();
  final TextEditingController ville = TextEditingController();

  final TextEditingController profession = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              color: presColor,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                  image: AssetImage("asset/img/no.PNG"), fit: BoxFit.cover),
            ),
          ),
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
                    Center(child: Text('Creer un compte prestataire')),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: nom,
                      decoration: const InputDecoration(
                        labelText: "Nom",
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'entrez votre nom';
                        }
                      },
                    ),
                    TextFormField(
                      controller: prenom,
                      decoration: const InputDecoration(
                        labelText: "Prenom",
                        icon: Icon(Icons.person_add),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'entrez votre prenom';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: telephone,
                      decoration: const InputDecoration(
                        labelText: "Telephone",
                        icon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'entrez votre telephone';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: ville,
                      decoration: const InputDecoration(
                        labelText: "Ville",
                        icon: Icon(Icons.card_giftcard),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'entrez votre ville';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: profession,
                      decoration: const InputDecoration(
                        labelText: "Profession",
                        icon: Icon(Icons.work),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'entrez votre profession';
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                      name: "Creer",
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          prestataireManager.addPrestataire(Prestatair(
                              nom.text.trim(),
                              prenom.text.trim(),
                              telephone.text.trim(),
                              ville.text.trim(),
                              profession.text.trim()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'votre compte a ete creer avc succes')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const Abonement(),
                              ));
                        }
                      },
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    ));
  }
}
