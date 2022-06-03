import 'package:flutter/material.dart';

import '../../widget/customs_buttom.dart';
import '../etape3.dart';
import '../publication/publie.dart';

class TableauPage extends StatelessWidget {
  const TableauPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        const Text("Commencer maintenant ", style: TextStyle(fontSize: 20)),
        Center(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
                "Vous pouvez maintenant publier des services en toute serenite en gagnant de l'argent . "),
          ),
        ),
        Icon(Icons.fingerprint_sharp),
        CustomButton(
            primary: true,
            name: 'Publier un service',
            ontap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Publie()));
            }),
        CustomButton(
            primary: false,
            name: 'S\'abonner',
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const Abonement()));
            }),
      ]),
    );
  }
}
