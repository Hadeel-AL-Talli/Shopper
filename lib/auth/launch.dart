import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/Explore_screen');
    });
    return Scaffold(
      backgroundColor: HexColor("#01221D"),
      body: Center(
        child: Image.asset('images/Logo.png'),
      ),
    );
  }
}
