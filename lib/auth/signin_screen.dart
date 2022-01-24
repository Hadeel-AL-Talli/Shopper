import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/api/api_helper.dart';
import 'package:shopper_project2/api/controller/auth_api_controller.dart';
import 'package:shopper_project2/auth/verify_code.dart';
import 'package:shopper_project2/helpers/helpers.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with ApiHelper{
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = navigateToRegisterScreen;
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
      body: Stack(
        children: [
          Image.asset('images/Pattern1.png',fit: BoxFit.fitHeight,height: double.infinity,),
          SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(height: 85.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/Logo.png',
                      width: 40.w,
                    ),
                     SizedBox(width: 12.w),
                     Text('Shop',
                        style: TextStyle(
                            color: Colors.white,
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
                 SizedBox(
                  height: 50.h,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 500.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         SizedBox(
                          height: 20.h,
                        ),
                         Text(
                           'Sign in',
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                         SizedBox(
                          height: 50.h,
                        ),
                        AppTextField(
                          hint: 'Phone number',
                          controller: _phoneTextEditingController,
                          prefixIcon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                         SizedBox(
                          height: 16.h,
                        ),
                        AppTextField(
                          hint: 'password',
                          controller: _passwordTextEditingController,
                          prefixIcon: Icons.lock,
                          obscureText: true,
                        ),
                         SizedBox(
                          height: 16.h,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/forget_password');
                            },
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Text('Forget Password ? ',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700)),
                            )),
                         SizedBox(
                          height: 70.h,
                        ),
                        CustomButton(
                            onPress: () async => await performLogin(),
                            text: 'Sign In',
                            color: HexColor("#07BFA5")),
                         SizedBox(
                          height: 10.h,
                        ),
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
                                style: TextStyle(
                                    color: HexColor("#07BFA5"),
                                    fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(

      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _phoneTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, '/main_screen');
  }
}
