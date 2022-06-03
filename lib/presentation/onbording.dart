import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';
import 'package:job_house/presentation/connection/etape1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pageController = PageController(initialPage: 0);
  double? currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            'asset/img/logo.jpg',
            width: 100,
            height: 40,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value.toDouble();
                });
              },
              children: const [
                Screen1(
                  img: "asset/img/onbordin1.png",
                  titre: "HomeWork Easly",
                  text:
                      "it is recommanded that you complete the asign to improve your all skills for beginner languages",
                ),
                Screen1(
                  img: "asset/img/onbordin2.png",
                  titre: "Fun Events",
                  text:
                      "Thanks to fun events ,you will follow your progress better and you will be able to socialize",
                ),
                Screen1(
                  img: "asset/img/onbordin3.png",
                  titre: "Timely Notification",
                  text:
                      "whith timely notifications your won't miss your lessons and homework and you won't have to worry",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                        dotColor: Colors.grey, activeDotColor: primaryCouleur),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentPage! >= 1.5) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Etape()));
                  }

                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(40),
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(Icons.arrow_forward_sharp,
                      size: 19, color: Colors.white),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,

                    // border: Border.all(color: grey,width: .2),

                    color: primaryCouleur,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final String img;
  final String titre;
  final String text;

  const Screen1({
    Key? key,
    required this.img,
    required this.titre,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: grey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(titre, style: secondaryText.copyWith(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
