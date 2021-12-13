import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/widget/custom_button.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(

                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Image.network('https://image.freepik.com/free-vector/realistic-new-year-background_52683-77635.jpg'),
                ),
                SizedBox(width: 10.w,),
                Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Image.network('https://image.freepik.com/free-vector/realistic-new-year-background_52683-77635.jpg'),
                ),
                SizedBox(width: 10.w,),
                Container(
                  height: 180.h,
                 // width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Image.network('https://image.freepik.com/free-vector/realistic-new-year-background_52683-77635.jpg'),
                ),


              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Product Name' , style: TextStyle(
                fontSize: 25.sp,
                  letterSpacing: 2,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700)),

              Text('100 \$ ' , style: TextStyle(
                  fontSize: 25.sp,
                  letterSpacing: 2,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700)),
            ],
          ),



          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(' Product info:' , style: TextStyle(fontFamily: 'Poppins', fontSize: 18, color: Colors.grey , fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum ' , style: TextStyle(fontFamily: 'Poppins' , fontSize: 15),),
          ),

          Align(
            alignment: AlignmentDirectional.topEnd,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite) , iconSize: 40, color: Colors.red,)),
            SizedBox(height: 30.h,),
          Row(
            children: [
              SizedBox(width: 10.w,),
              CustomButton(onPress: (){}, text: 'Buy Now', color: HexColor("#07BFA5")),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart) , iconSize: 35, color:HexColor("#07BFA5") ,)
            ],
          )
        ],
      ),
    );
  }
}
