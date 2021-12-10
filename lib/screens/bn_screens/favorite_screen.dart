import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_project2/widget/custom_button.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
        Center(child: Text('Your Favorite is Empty ', style: TextStyle(fontFamily: 'Poppins' , fontSize: 22, fontWeight: FontWeight.bold),)),

        Center(child: CustomButton(onPress: (){}, text: 'Start Shopping', color: Colors.black))
      ],)
    );
  }
}
