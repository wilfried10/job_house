import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_house/data/model/user.dart';
import 'package:job_house/data/provider/user_provider.dart';
import 'package:job_house/presentation/settings.dart';
import 'package:job_house/presentation/gestionprestation.dart';

import '../constantes.dart';
import '../services/shared_pref.dart';
import 'connection/etape1.dart';
import 'connection/profilecon.dart';
import 'connection/sing_up.dart';
import 'homeA.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int a = 0;
  int actifIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ""),
        ],
        currentIndex: a,
        onTap: (int value) {
          setState(() {
            a = value;
          });
        },
        selectedItemColor: primaryCouleur,
      ),
      body: [
        const HomeA(),
        const GestionPrestation(),
        Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('user').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  if (!snapshot.hasData) {
                    return Text("chargement");
                  }
                  QuerySnapshot data = snapshot.requireData as QuerySnapshot;
                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        Map item = data.docs[index].data() as Map;

                        return Column(children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 38),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryCouleur,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  width: 45,
                                  height: 53,
                                  decoration: BoxDecoration(
                                    color: fontProfile,
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("asset/img/femey.PNG"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item['username'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      Text(item['email']),
                                      GestureDetector(
                                          child: Text("Edit ",
                                              style: TextStyle(
                                                  color: Colors.blue))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SettingRow(
                            nom: 'Mes favories',
                            settingIcon: Icons.heart_broken_rounded,
                            ontap: () {},
                            index: 1,
                            isActif: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SettingRow(
                            nom: 'Paramettres generales',
                            settingIcon: Icons.settings,
                            ontap: () {},
                            index: 2,
                            isActif: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SettingRow(
                            nom: 'Termes et conditions',
                            settingIcon: Icons.book,
                            ontap: () {},
                            index: 3,
                            isActif: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SettingRow(
                            nom: 'Partager cette application ',
                            settingIcon: Icons.share,
                            ontap: () {},
                            index: 4,
                            isActif: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SettingRow(
                            nom: 'Mode sombre ',
                            settingIcon: Icons.dark_mode,
                            ontap: () {},
                            index: 5,
                            isActif: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SettingRow(
                            nom: 'Deconnection ',
                            settingIcon: Icons.dashboard,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Etape()));

                              Shared.setConnect(false);
                            },
                            index: 6,
                            isActif: false,
                          ),
                        ]);
                      });
                }),
          ),
        ),
      ][a],
    );
  }
}
