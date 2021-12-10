import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/code_text_feild.dart';
import 'package:shopper_project2/widget/custom_button.dart';
import 'package:shopper_project2/widget/custom_text_feild.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  @override
  void initState() {
    // TODO: implement initState

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

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
                      const  Text('Verify Code' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Please enter verify code that we’ve sent to your phone number.',


                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.grey, fontSize: 14)),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      Expanded(
                        child: CodeTextField(
                          textEditingController: _firstCodeTextController,
                          focusNode: _firstFocusNode,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _secondFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CodeTextField(
                          textEditingController: _secondCodeTextController,
                          focusNode: _secondFocusNode,
                          onChanged: (value) {
                            value.isNotEmpty
                                ? _thirdFocusNode.requestFocus()
                                : _firstFocusNode.requestFocus();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CodeTextField(
                          textEditingController: _thirdCodeTextController,
                          focusNode: _thirdFocusNode,
                          onChanged: (value) {
                            value.isNotEmpty
                                ? _fourthFocusNode.requestFocus()
                                : _secondFocusNode.requestFocus();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CodeTextField(
                          textEditingController: _fourthCodeTextController,
                          focusNode: _fourthFocusNode,
                          onChanged: (value) {
                            if (value.isEmpty) _thirdFocusNode.requestFocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),



                  CustomButton(onPress: (){
                            Navigator.pushNamed(context, '/ChangePassword');
                  }, text: ' Verify', color: HexColor("#07BFA5")),



                ],),
            ),
          )
        ],)),
      ),
    );
  }


}
