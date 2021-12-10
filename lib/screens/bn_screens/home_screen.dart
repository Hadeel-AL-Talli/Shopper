import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopper_project2/get/home_getx_controller.dart';
import 'package:shopper_project2/widget/category_widget.dart';
import 'package:shopper_project2/widget/product_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 80, left: 20),
                  alignment: AlignmentDirectional.topStart,
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      color: HexColor('#01221D')),
                  child: Text('Home',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins')),
                ),
                Positioned(
                    top: 120,
                    bottom: 20,
                    right: 50,
                    left: 50,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: 200.h,
                        width: 500.w,
                        child: CarouselSlider(
                            items: [
                             // for (var i = 0; i < Slider.image.length; i++)
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage('image[i]'),
                                      fit: BoxFit.fitHeight,
                                    ),
                                    // border:
                                    //     Border.all(color: Theme.of(context).accentColor),
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                            ],
                            options: CarouselOptions(
                              height: 500.h,

                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              // onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            )))),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text('Categories',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins')),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Category widget
                  CategoryWidget(),
                  SizedBox(
                    width: 20.w,
                  ),
                  CategoryWidget(),
                  SizedBox(
                    width: 20.w,
                  ),
                  CategoryWidget(),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text('Latest Products ',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins')),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
            //Product Widget
            Column(
              children: [
                ProductWidget(),
                ProductWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
