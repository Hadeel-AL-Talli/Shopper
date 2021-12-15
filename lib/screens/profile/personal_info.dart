import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Colors.black,)
        ],
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Personal Info' , style:TextStyle(fontFamily: 'Poppins' , fontWeight: FontWeight.bold, fontSize:18 , color: Colors.black)),),

      body: null,
    );
  }
}
