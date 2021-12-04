
import 'package:flutter/material.dart';
import 'package:shopper_project2/auth/exploreus_screen.dart';
import 'package:shopper_project2/auth/on_boarding.dart';
import 'package:shopper_project2/auth/signin_screen.dart';


import 'auth/create_account_screen.dart';
import 'auth/forget_password_screen.dart';
import 'auth/launch.dart';
import 'auth/verify_screen.dart';
import 'auth/welcome.dart';
import 'widget/change_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [

      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/welcome_screen': (context) => Welcome(),
        '/OnBoarding':(context)=> OnBoarding(),
        '/Explore_screen':(context)=> Explore(),
        '/Sign_in':(context)=> SignIn(),
        '/create_account':(context)=> CreateAccount(),
        '/forget_password':(context) =>ForgetPassword(),
        '/Verify_screen':(context)=> Verify(),
        '/ChangePassword':(context)=>ChangePassword()





      },
    );
  }
}
