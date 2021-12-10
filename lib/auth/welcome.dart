import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
         SizedBox(
          height: 20.h,
        ),
        Image.asset('images/onboarding4.png'),
         SizedBox(height: 30.h),
        Container(
            margin: const EdgeInsets.only(left: 30),
            alignment: Alignment.topLeft,
            child: Image.asset(
              'images/Logo.png',
              width: 48.w,
              height: 48.h,
            )),
         Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text('Welcome to',

                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp,
                      fontFamily: 'Poppins')),
              Row(
                children: [
                  SizedBox(width:50.w),
                  Text('Shop',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          fontFamily: 'Poppins')),
                  Text('per',
                      style: TextStyle(
                          color: HexColor("#07BFA5"),
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          fontFamily: 'Poppins')),
                ],
              ),
            ],
          ),
        ),
         SizedBox(height: 20.h),
         Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              'Make it your own. As you are setting up your online store, you have the ability to customize.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins', color: Colors.grey, fontSize: 14.sp)),
        ),
         SizedBox(height: 40.h),
        CustomButton(color: Colors.black,text: 'Sign In',onPress: (){
          //TODO:Navigate to sign up
          Navigator.pushNamed(context, '/Sign_in');
        }),
         SizedBox(
          height: 20.h,
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/create_account');
          },
          child:  Text('Register',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp)),
        )
      ],
    )));
  }
}


