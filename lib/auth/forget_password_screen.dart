import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _phoneTextEditingController;


  @override
  void initState() {
    // TODO: implement initState
    _phoneTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();

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
                      const  Text('Forget Password ' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Please enter your phone number, we will send an verify code.',

                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.grey, fontSize: 14)),
                  ),
                  const SizedBox(height: 50,),
                  AppTextField(hint: 'Phone number', controller: _phoneTextEditingController, prefixIcon: Icons.email,keyboardType: TextInputType.phone, ),
                  const SizedBox(height: 50,),



                  CustomButton(onPress: (){
                      //TODO:send verification code to phone number
                    Navigator.pushNamed(context, '/Verify_screen');
                  }, text: ' Verify', color: HexColor("#07BFA5")),



                ],),
            ),
          )
        ],)),
      ),
    );
  }
}
