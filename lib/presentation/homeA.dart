import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';

import 'besoin.dart';

class HomeA extends StatefulWidget {
  const HomeA({Key? key}) : super(key: key);

  @override
  State<HomeA> createState() => _HomeAState();
}

class _HomeAState extends State<HomeA> {
  int actifIndex = 0;

  @override
  Widget build(BuildContext context) {
    categorie(
      BuildContext context, {
      required IconData categorieIcon,
      required String categorieNom,
      required int index,
      bool isActif = false,
    }) {
      return GestureDetector(
        onTap: () {
          setState(() {
            actifIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: isActif ? null : basicColor.withOpacity(.1),
                    shape: BoxShape.circle,
                    gradient: isActif ? degrader : null),
                child: Icon(categorieIcon,
                    color: isActif ? Colors.white : fontProfile),
              ),
              Text(categorieNom,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black))
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryCouleur,
                      ),
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
                          Text("Welcome",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text("Jimmy Suillivan ",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ]),
                  ),
                  const Spacer(),
                  Icon(Icons.notifications, color: basicColor.withOpacity(.5)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: basicColor.withOpacity(.1),
                        blurRadius: .2,
                        spreadRadius: .5,
                        offset: const Offset(0, 2)),
                    BoxShadow(
                      color: basicColor.withOpacity(.1),
                    )
                  ],
                  color: fontCouleur,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Rechercher une offre",
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(9),
                    width: double.infinity,
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: degrader,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            right: -47,
                            child: Container(
                                height: 180,
                                width: 180,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                )),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Proposez et retrouvez ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text("Des services de qualites ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text("A des prix incroyables ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: boutonColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            const Besoin(),
                                                      ));
                                                },
                                                child: const Text(
                                                  "Mon Besoin",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 25,
                            right: 23,
                            child: Container(
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset(
                                'asset/img/lut.PNG',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Categories",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categorie(
                      context,
                      categorieIcon: Icons.person,
                      categorieNom: 'beaute',
                      index: 0,
                      isActif: actifIndex == 0,
                    ),
                    categorie(
                      context,
                      categorieIcon: Icons.chair,
                      categorieNom: 'Immobillier',
                      index: 1,
                      isActif: actifIndex == 1,
                    ),
                    categorie(
                      context,
                      categorieIcon: Icons.computer,
                      categorieNom: ' informatique',
                      index: 2,
                      isActif: actifIndex == 2,
                    ),
                    categorie(
                      context,
                      categorieIcon: Icons.key,
                      categorieNom: 'mecanique',
                      index: 3,
                      isActif: actifIndex == 3,
                    ),
                    categorie(
                      context,
                      categorieIcon: Icons.house,
                      categorieNom: 'marconerie',
                      index: 4,
                      isActif: actifIndex == 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Text("Best cleaners of comunity",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                            )),
                    const Spacer(),
                    Text("See now",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: primaryCouleur, fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cleanerJob(),
                    Description(),
                    cleanerJob(),
                    Description(),
                    cleanerJob(),
                    Description(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container cleanerJob() {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 50,
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.blue,
        image: const DecorationImage(
            image: AssetImage("asset/img/lut.PNG"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 19),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 220, 220)
                        .withOpacity(.1),
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      child: Container(
                          height: 30,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10.0,
                          )),
                    ),
                    Text("Violetta Joyce",
                        style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
