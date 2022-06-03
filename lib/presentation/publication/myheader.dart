import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';

class Myheader extends StatefulWidget {
  const Myheader({Key? key}) : super(key: key);

  @override
  State<Myheader> createState() => _MyheaderState();
}

class _MyheaderState extends State<Myheader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: scrolPassage,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration:const BoxDecoration(
                shape: BoxShape.circle,
                image:  DecorationImage(
                    image: AssetImage("asset/img/gagne.jpg")))
                    ),
                   const Text("Jemy clover",style:TextStyle(color:Colors.white,fontSize:20)),
                   const Text("info@memo.com",
            style: TextStyle(color: Colors.white, fontSize: 14,),)

      ]),
    );
  }
}
