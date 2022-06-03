import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';

class ProfilCon extends StatelessWidget {
  const ProfilCon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children:[
            Container(
              margin:const EdgeInsets.symmetric(vertical:29),
              width:double.infinity,
            child:const Text("Profi d'utilisateur", style:secondaryText),
            ), 
         const   SizedBox(height: 10,),
         Row(
           children:[
               Container(
         height: 60,
         width: 60,
         decoration:const BoxDecoration(
           shape: BoxShape.circle,
           
         ),
         child: Icon(Icons.person)),
      
       
       Text("nom")
           ],
         ),
    Text(""),
          ],
        ),
      )
      ,
    );
  }
}