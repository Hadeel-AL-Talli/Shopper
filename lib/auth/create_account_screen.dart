import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/api/api_helper.dart';
import 'package:shopper_project2/api/controller/auth_api_controller.dart';
import 'package:shopper_project2/auth/verify_code.dart';
import 'package:shopper_project2/get/drop_down_controller.dart';
import 'package:shopper_project2/helpers/helpers.dart';
import 'package:shopper_project2/models/city.dart';
import 'package:shopper_project2/models/register_user.dart';
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
  List<City> _cities = <City>[];
  late Future<List<City>> _future;
  bool createDrop=false;
  late City dropdownvalue ;
  late String indexcity ;
  String _gender = 'M';
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _passwordTextEditingController;
  //late TextEditingController _emailTextEditingController;

   int _cityId = 1;

  @override
  void initState() {
    // TODO: implement initState
    _future = DropDownController().getcities();
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

                        AppTextField(
                            hint: 'password',
                            controller: _passwordTextEditingController,
                            prefixIcon: Icons.lock),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text('City :', textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black, fontSize: 20 , fontFamily: 'Poppins' , fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 50.w,),
                            FutureBuilder<List<City>>(
                              future: _future,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                  _cities = snapshot.data ?? [];
                                  if(!createDrop) dropdownvalue=_cities.first;
                                  return DropdownButton<City>(
                                    value: dropdownvalue,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    underline: SizedBox(),
                                    items: _cities.map((e) {
                                      return DropdownMenuItem<City>(child: Text(e.nameEn),value: e,);
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownvalue = value!;
                                        createDrop=true;
                                        _cityId=value.id;
                                        print(indexcity);
                                        print(dropdownvalue.nameEn);
                                      });
                                    },
                                  );
                                }
                                else {
                                  return Center(
                                    child: Column(
                                      children: const [
                                        Icon(Icons.warning, size: 80),
                                        Text(
                                          'NO DATA',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
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
                            onPress: () async {

                              await performRegister();


                            },
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
         _cities.isNotEmpty &&
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

    if (status){ Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) =>
        VerifyCode(phone: _phoneTextEditingController.text),


    ),
    );
  }
  }

  RegisterUser get user {
    RegisterUser user = RegisterUser();
    user.name = _nameTextEditingController.text;
    user.password=_passwordTextEditingController.text;
    user.mobile = _phoneTextEditingController.text;
    user.gender = _gender;
    user.cityId = _cityId;
    return user;
  }
}
