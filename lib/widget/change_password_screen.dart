import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/code_text_feild.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  late TextEditingController _password;
  late TextEditingController _confirmPassword;

  @override
  void initState() {
    // TODO: implement initState
       _password = TextEditingController();
       _confirmPassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _password.dispose();
    _confirmPassword.dispose();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: HexColor("#01221D"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(child: Column(children: [
          const  SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/Logo.png',width: 40,),
              const SizedBox(width:12),
              const  Text('Shop',
                  style: TextStyle(
                      color: Colors.white,
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
          ),
          const SizedBox(height: 50,),
          Container(
            margin: const EdgeInsets.all(20.0),
            height: 500,
            width: 500,
            decoration: BoxDecoration(

                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),

                  Row(

                    children: [
                      GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      SizedBox(width: 20,),
                      const  Text('Change Password' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                    ],
                  ),

                 SizedBox(height:20),
                  AppTextField(
                    hint: 'Password',
                    controller: _password,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    hint: 'Password Confirmation',
                    controller: _confirmPassword,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),

                  const SizedBox(height: 50,),



                  CustomButton(onPress: (){

                  }, text: ' Save Changes', color: HexColor("#07BFA5")),



                ],),
            ),
          )
        ],)),
      ),
    );
  }
}
