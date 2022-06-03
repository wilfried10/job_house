import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_house/presentation/connection/etape1.dart';
import 'package:job_house/presentation/home.dart';
import 'package:job_house/presentation/onbording.dart';
import 'package:job_house/services/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Shared.init();

  return runApp(
    const Melmo(),
  );
}

class Melmo extends StatelessWidget {
  const Melmo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shared.getConnect() ? const Home() : const MyApp(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(fontWeight: FontWeight.w900, fontFamily: "Poppins"),
          bodyMedium:
              TextStyle(fontWeight: FontWeight.w400, fontFamily: "Poppins"),
          bodySmall: TextStyle(fontSize: 12, fontFamily: "Poppins"),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0),
        fontFamily: "Poppins",
      ),
    );
  }
}
