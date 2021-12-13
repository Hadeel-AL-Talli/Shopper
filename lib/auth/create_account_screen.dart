import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/api/api_helper.dart';
import 'package:shopper_project2/api/controller/auth_api_controller.dart';
import 'package:shopper_project2/get/drop_down_controller.dart';
import 'package:shopper_project2/get/home_getx_controller.dart';
import 'package:shopper_project2/models/city.dart';
import 'package:shopper_project2/models/user.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopper_project2/models/user.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> with ApiHelper {
 DropDownController dropDownController = DropDownController();

  List<City> _cities =   DropDownController().getcities() as List<City>  ;

  String? dropDownValue ;

  String _gender = 'M';
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _passwordTextEditingController;
  //late TextEditingController _emailTextEditingController;

  late int _cityId;

  @override
  void initState() {
    // TODO: implement initState

    _phoneTextEditingController = TextEditingController();
    _nameTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
   // _emailTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _nameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    //_emailTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Scaffold(
                backgroundColor: HexColor("#01221D"),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SafeArea(
                      child: Column(
                        children: [
                          //const  SizedBox(height: 20,),
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
                            height: 30.h,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20.0),
                            height: 635.h,
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
                                    'Register ',
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  AppTextField(
                                    hint: 'Name',
                                    controller: _nameTextEditingController,
                                    prefixIcon: Icons.person,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 15.h,
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
                                  Obx(()=>
                                    DropdownButton<dynamic>(

                                      isExpanded: true,
                                      elevation: 10,
                                      hint: Text('Select City', style:TextStyle(color:Colors.red)),
                                      value: dropDownController.selected.value,
                                      onChanged: (newValue){
                                          dropDownController.setSelected(newValue!);
                                      },
                                      items:

                                      _cities.map((e) {
                                        return DropdownMenuItem(child: Text('${e.nameEn}') , value: e,);
                                      }).toList(),





                                    ),
                                  ),

                                  AppTextField(
                                      hint: 'password',
                                      controller: _passwordTextEditingController,
                                      prefixIcon: Icons.lock),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text('Male',
                                        style: TextStyle(fontFamily: 'Poppins')),
                                    value: 'M',
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      }
                                    },
                                  ),
                                  RadioListTile<String>(
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text('Female',
                                        style: TextStyle(fontFamily: 'Poppins')),
                                    value: 'F',
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      }
                                    },
                                  ),
                                  CustomButton(
                                      onPress: () async => await performRegister(),
                                      text: 'Register',
                                      color: HexColor("#07BFA5")),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              );

  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&

        _gender.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context, user: user);
    if (status) Navigator.pop(context);
  }

  User get user {
    User user = User();
    user.name = _nameTextEditingController.text;

    user.mobile = _phoneTextEditingController.text;

    user.gender = _gender;
    user.cityId = _cityId;
    return user;
  }
}
