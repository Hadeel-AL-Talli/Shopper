import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/custom_button.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 30,),
                Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/Logo.png', width: 40,),
                    SizedBox(width: 12,),
                    Text('Shop',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Poppins')),
                    Text('per',
                        style: TextStyle(
                            color: HexColor("#07BFA5"),
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Poppins')),
                  ],
                ),),
                CustomButton(onPress: (){
                  Navigator.pushNamed(context, '/OnBoarding');
                }, text: 'Explore Us', color: Colors.black)
              ],
            )
    );
  }
}
