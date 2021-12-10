import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [

              Container(
                padding:const  EdgeInsets.all(60),
                alignment: AlignmentDirectional.topStart,
                height: 375.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                    color: HexColor('#01221D')),
        child: Text('Home' , style:TextStyle(fontSize: 22.sp, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),


              ),


             Positioned(
               top:120,
                 bottom: 20,
                 right: 50,
                 left: 50,

                 child: Container(
                   decoration: BoxDecoration(color: Colors.white ,borderRadius: BorderRadius.circular(20)),
                   height: 200.h,
                     width: 500.w,
                     child:
                     CarouselSlider(
                         items: [
                           Image.network('https://img.freepik.com/free-photo/modern-stylish-muslim-woman-hijab-business-style-jacket-black-abaya-walking-city-street-with-laptop_285396-9493.jpg?size=338&ext=jpg', fit:BoxFit.fitHeight),
                           Image.network('https://img.freepik.com/free-photo/working-online-portrait-beautiful-arabian-businesswoman-wearing-hijab-while-working-openspace-office-concept-occupation-freedom-business-area-leadership-success-modern-solution_489646-12257.jpg?size=338&ext=jpg',fit:BoxFit.fitHeight),
                           Image.network('https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg', fit:BoxFit.fitHeight , width: 500.w,)

                         ],
                         options: CarouselOptions(
                           height: 400.h,
                           //aspectRatio: 16/9,
                           viewportFraction: 0.8,
                           initialPage: 0,
                           enableInfiniteScroll: true,
                           reverse: false,
                           autoPlay: true,
                           autoPlayInterval: Duration(seconds: 3),
                           autoPlayAnimationDuration: Duration(milliseconds: 800),
                           autoPlayCurve: Curves.fastOutSlowIn,
                           enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                           scrollDirection: Axis.horizontal,
                         )
                     )
                     )),





            ],
          ),
           SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Text('Categories', style:TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
        SingleChildScrollView(
          padding: EdgeInsets.all(20),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Category widget
            Container(
                width: 150.w,
                height: 88.h,
                decoration: BoxDecoration(color: Colors.grey.shade200 , borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Text('Clothes' , style: TextStyle(fontSize: 14.sp,fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                  SizedBox(width: 30.w,),
                  Image.network('https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg', width: 52.w,height:52.h,fit: BoxFit.cover,)
                ],)
            ),
            SizedBox(width: 20.w,),
            Container(
                width: 150.w,
                height: 88.h,
                decoration: BoxDecoration(color: Colors.grey.shade200 , borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Text('Clothes' , style: TextStyle(fontSize: 14.sp,fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                  SizedBox(width: 30.w,),
                  Image.network('https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg', width: 52.w,height:52.h,fit: BoxFit.cover,)
                ],)
            ),
              SizedBox(width: 20.w,),
              Container(
                  width: 150.w,
                  height: 88.h,
                  decoration: BoxDecoration(color: Colors.grey.shade200 , borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [

                    Text('Clothes' , style: TextStyle(fontSize: 14.sp,fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                    SizedBox(width: 30.w,),
                    Image.network('https://image.freepik.com/free-photo/studio-shot-cheerful-religious-muslim-woman-keeps-arms-folded-smiles-broadly-has-white-teeth_273609-27065.jpg', width: 52.w,height:52.h,fit: BoxFit.cover,),

                  ],
                  ),

              ),


          ],),

        ),
          SizedBox(height:20.h ,),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Text('Latest Products ', style:TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
          //Product Widget



        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home' , backgroundColor: HexColor("#01221D")),
          BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Category',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart) , label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Profile'),



        ],
      ),

    );
  }
}
