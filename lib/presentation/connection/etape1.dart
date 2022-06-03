import 'package:flutter/material.dart';
import 'package:job_house/presentation/connection/sing_in.dart';

import 'package:job_house/presentation/connection/sing_up.dart';
import 'package:job_house/widget/animation.dart';
import 'package:job_house/widget/customs_buttom.dart';

class Etape extends StatelessWidget {
  const Etape({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
Animated(
  delay: 50,
  child: Image.asset('asset/img/logo.jpg',width: 100,height: 50,))
        ],

      ),
      body:
      Column(
        children: [
          Animated(
            delay:250,
            child: Expanded(

            child: Container(
              width: double.infinity,
            padding:const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Image.asset("asset/img/start.png",
              fit: BoxFit.cover,
      width: double.infinity,
              ),
            ),
            
            
        ),
          ),
     
        Animated(
          delay: 400,
          child: Expanded(child: Column(children: [
           
              CustomButton(primary: true, name: 'S \'inscrire', ontap: (){ Navigator.push(context, MaterialPageRoute(builder: (_)=>const SingUp() ));}),
           
              CustomButton(primary: false, name: 'Se connecter', ontap: (){ Navigator.push(context, MaterialPageRoute(builder: (_)=>const SingIn() ));}),

      //  CustomButton(primary: false, name: 'Se connecter', ontap: (){ Shared.setConnect(true);})
           
          ],)
            
          ),
        )
        ],
      )
      ,
      
    );
  }
}