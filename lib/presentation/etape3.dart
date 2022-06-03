import 'package:flutter/material.dart';
import 'package:job_house/presentation/publication/myheader.dart';
import 'package:job_house/presentation/publication/publie.dart';

import '../constantes.dart';
import '../widget/customs_buttom.dart';
import 'menuPrestataire/changePage.dart';
import 'menuPrestataire/notificationPage.dart';
import 'menuPrestataire/recettePage.dart';
import 'menuPrestataire/servicePage.dart';
import 'menuPrestataire/statPage.dart';
import 'menuPrestataire/tableauPage.dart';

class Abonement extends StatefulWidget {
  const Abonement({Key? key}) : super(key: key);

  @override
  State<Abonement> createState() => _AbonementState();
}

class _AbonementState extends State<Abonement> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = TableauPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = StatPage();
    } else if (currentPage == DrawerSections.events) {
      container = RecettePage();
    } else if (currentPage == DrawerSections.notes) {
      container = ServicePage();
    } else if (currentPage == DrawerSections.settings) {
      container = NotificationPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = ChangePage();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenu"),
          backgroundColor: scrolPassage,
        ),
        body: container,
        drawer: Drawer(
          child: SingleChildScrollView(
              child: Container(
            child: Column(children: [
              Myheader(),
              Mylist(),
            ]),
          )),
        ),
      ),
    );
  }

  Widget Mylist() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Tableau de bord", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Statistiques des commades", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Recettes", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Mes services", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Notifications", Icons.notifications,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Changer mot de passe", Icons.settings_outlined,
              currentPage == DrawerSections.notifications ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
        color: selected ? scrolPassage : basicColor.withOpacity(.1),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.dashboard;
              } else if (id == 2) {
                currentPage = DrawerSections.contacts;
              } else if (id == 3) {
                currentPage = DrawerSections.events;
              } else if (id == 4) {
                currentPage = DrawerSections.notes;
              } else if (id == 5) {
                currentPage = DrawerSections.settings;
              } else if (id == 6) {
                currentPage = DrawerSections.notifications;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(child: Icon(icon, size: 20, color: Colors.black)),
                Expanded(
                    flex: 3,
                    child: Text(title,
                        style: TextStyle(color: Colors.black, fontSize: 16))),
              ],
            ),
          ),
        ));
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
