import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/api/api_helper.dart';
import 'package:shopper_project2/api/controller/auth_api_controller.dart';
import 'package:shopper_project2/api/controller/update_profile_controller.dart';
import 'package:shopper_project2/auth/verify_code.dart';
import 'package:shopper_project2/helpers/helpers.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with ApiHelper{
  late TextEditingController _currentpasswordTextEditingController;
  late TextEditingController _passwordTextEditingController;
late TextEditingController _confirmpasswordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _currentpasswordTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmpasswordTextEditingController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _currentpasswordTextEditingController.dispose();
    _passwordTextEditingController.dispose();
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
                        Row(

                          children: [
                            IconButton(icon:Icon(Icons.arrow_back_ios), color: Colors.black,onPressed: (){
                              Navigator.pop(context);
                            },),
                            SizedBox(width: 30.w,),
                            Text(
                              'Change Password ',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        AppTextField(
                          hint: 'password',
                          controller: _currentpasswordTextEditingController,
                          prefixIcon: Icons.lock,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        AppTextField(
                          hint: ' New password',
                          controller: _passwordTextEditingController,
                          prefixIcon: Icons.lock,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        AppTextField(
                          hint: ' Confirm password',
                          controller: _confirmpasswordTextEditingController,
                          prefixIcon: Icons.lock,

                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        CustomButton(
                            onPress: () async {
                             await performChangePassword();
                            },
                            text: 'Save Changes',
                            color: HexColor("#07BFA5")),

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
  Future<void> performChangePassword() async {
    if (checkData()) {
      await changePassword();
    }
  }

  bool checkData() {
    if (checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword(){
    if(_passwordTextEditingController.text.isNotEmpty && _confirmpasswordTextEditingController.text.isNotEmpty){

      if(_passwordTextEditingController.text == _confirmpasswordTextEditingController.text){
        return true;
      }
      showSnackBar(context, message: 'Password confirmation error!' , error: true);
      return false;
    }
    showSnackBar(context, message: 'Enter new Password ' , error: true);
    return false;
  }



  Future<void> changePassword() async {
    bool status = await UpdateProfileApiController().changePassword(context ,currentpassword:_currentpasswordTextEditingController.text, newpassword: _passwordTextEditingController.text , confirmpassword: _confirmpasswordTextEditingController.text);
    if (status) Navigator.pop(context);
  }

}
