import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

   String _gender = 'M';
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _emailTextEditingController;

  @override
  void initState() {
    // TODO: implement initState

    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _emailTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      backgroundColor: HexColor("#01221D"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(child: Column(children: [
          //const  SizedBox(height: 20,),
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
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.all(20.0),
            height: 635,
            width: 500,
            decoration: BoxDecoration(

                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  const  Text('Register ' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                  const SizedBox(height: 30,),
                  AppTextField(hint: 'Email', controller:_emailTextEditingController , prefixIcon: Icons.email,keyboardType: TextInputType.emailAddress, ),
                  const SizedBox(height: 15,),

                  AppTextField(hint: 'Phone number', controller:_phoneTextEditingController , prefixIcon: Icons.phone,keyboardType: TextInputType.phone, ),
                  const SizedBox(height: 16,),
                  DropdownButtonFormField(

                      items: [

                  ]),
                  AppTextField(hint: 'password', controller: _passwordTextEditingController, prefixIcon: Icons.lock),


                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(

                      'Gender',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Male' , style:TextStyle(fontFamily: 'Poppins')),
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
                    title: const Text('Female',style:TextStyle(fontFamily: 'Poppins')),
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
                  CustomButton(onPress: (){}, text: 'Register', color: HexColor("#07BFA5")),



                ],),
            ),
          )
        ],)),
      ),
    );
  }

  }
