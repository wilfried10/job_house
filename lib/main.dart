
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_house/presentation/connection/etape1.dart';
import 'package:job_house/presentation/onbording.dart';
import 'package:job_house/services/shared_pref.dart';



 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Shared.init();
 
  
  return runApp(   
  const Melmo(),
   );
}
class Melmo extends StatelessWidget {
  const Melmo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shared.getConnect()? const Etape() : const MyApp(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
appBarTheme:const AppBarTheme(backgroundColor: Colors.transparent,elevation: 0),
        fontFamily:"Montserrat",
      ),
    );
  }
}



