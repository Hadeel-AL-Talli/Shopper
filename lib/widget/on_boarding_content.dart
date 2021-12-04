import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  String? imagepath;
  String? title;
  String? subtitle;
   OnBoardingContent({this.imagepath , this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(


      children: [
        const  SizedBox(height: 90,),

          Text(title! , textAlign:TextAlign.center, style: const TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),

        Text(subtitle!,textAlign: TextAlign.center , style: const TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
        const SizedBox(height: 100,),
        Image.asset(imagepath!)

      ],
    );
  }
}
