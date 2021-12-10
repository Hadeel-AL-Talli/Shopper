import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
     String route = SharedPrefController().loggedIn ? '/main_screen': '/Sign_in';
     Navigator.pushReplacementNamed(context, route);

    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: HexColor("#01221D"),
      body: Center(
        child: Image.asset('images/Logo.png'),
      ),
    );
  }
}
