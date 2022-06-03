import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';

import '../services/shared_pref.dart';
import 'connection/sing_up.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int actifIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                            image: AssetImage("asset/img/femey.PNG"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jimmy Suillivan ",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const Text("ladoucemelissa10@gmail.com"),
                          GestureDetector(
                              child: Text("Edit ",
                                  style:
                                      Theme.of(context).textTheme.bodySmall)),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SingUp()));

                  Shared.setConnect(false);
                },
                index: 6,
                isActif: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  final IconData settingIcon;
  final String nom;
  final void Function() ontap;
  final int index;
  final bool isActif;
  const SettingRow({
    Key? key,
    required this.settingIcon,
    required this.nom,
    required this.ontap,
    required this.index,
    required this.isActif,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: isActif ? null : basicColor.withOpacity(.1),
          gradient: degrader,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(settingIcon,
                  color: isActif ? Colors.white : Colors.black),
            ),
            Text(nom)
          ],
        ),
      ),
    );
  }
}
