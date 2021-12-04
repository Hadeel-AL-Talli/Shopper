import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 late TextEditingController _phoneTextEditingController;
 late TextEditingController _passwordTextEditingController;
 late TapGestureRecognizer _tapGestureRecognizer;
 @override
  void initState() {
    // TODO: implement initState
   _phoneTextEditingController = TextEditingController();
   _passwordTextEditingController = TextEditingController();
   _tapGestureRecognizer = TapGestureRecognizer()..onTap = navigateToRegisterScreen;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }
 void navigateToRegisterScreen() {
   Navigator.pushNamed(context, '/create_account');
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
                    const  Text('Sign In ' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                 const SizedBox(height: 50,),
                  AppTextField(hint: 'Phone number', controller: _phoneTextEditingController, prefixIcon: Icons.email,keyboardType: TextInputType.phone, ),
                 const SizedBox(height: 16,),

                  AppTextField(hint: 'password', controller: _passwordTextEditingController, prefixIcon: Icons.lock,obscureText: true, ),
               const   SizedBox(height: 16,),
                 GestureDetector(
                   onTap: (){
                     Navigator.pushNamed(context, '/forget_password');
                   },
                     child:const  Align(
                       alignment: Alignment.topRight,
                       child: Text(

                           'Forget Password ? ', style:TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w700)),
                     )),
                 const SizedBox(height: 70,),
                  CustomButton(onPress: (){

                  }, text: 'Sign In', color: HexColor("#07BFA5")),

                const  SizedBox(height: 10,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          recognizer: _tapGestureRecognizer,
                          text: 'Create Now!',
                          style:  TextStyle(
                            color: HexColor("#07BFA5"),
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),

              ],),
            ),
          )
        ],)),
      ),
    );
  }
}
