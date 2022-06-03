import 'package:flutter/material.dart';
import 'package:job_house/constantes.dart';



class CustomButton extends StatelessWidget {
  final bool primary ;
  final String name;
  final void Function() ontap;
  

  const CustomButton({ Key? key, this.primary = true,  required this.name, required this.ontap }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return  GestureDetector(
      onTap:ontap,
    
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        
        padding: const EdgeInsets.symmetric(vertical:14),
        margin: const EdgeInsets.symmetric(horizontal:30, vertical: 18),
        
    child: Text(name,style: TextStyle(color: primary  ?  bg: primaryCouleur ,fontWeight: FontWeight.w700),),
    decoration: BoxDecoration(
      border: !primary ? Border.all(color: primaryCouleur, width:2) : null,
      color: !primary  ?  null: primaryCouleur,
      borderRadius:BorderRadius.circular(20)
    ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
    
      onTap: (){},
    
      child:   Container(
    
      
    
        alignment: Alignment.center,
    
      
    
        padding:const EdgeInsets.all(8),
    
      
    
      child:const Icon(Icons.arrow_back_ios,size: 18,),
    
      
    
      decoration: BoxDecoration(
    
      
    
        shape: BoxShape.circle,
    
      
    
        border: Border.all(color: grey,width: .2),
    
      
    
        color: Colors.white
    
      
    
      ),
    
      
    
      ),
    
    );
  }
}