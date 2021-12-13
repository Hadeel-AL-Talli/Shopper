import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopper_project2/api/controller/home_api_controller.dart';
import 'package:shopper_project2/get/home_getx_controller.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/home_response.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/widget/category_widget.dart';
import 'package:shopper_project2/widget/product_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeGetxController _homeGetxController = Get.put(HomeGetxController());
  List<Product> _latestProduct = <Product>[];
  List<Product> _famousProduct = <Product>[];
  List<Slider> _slider = <Slider> [];
  List<Category> _categories = <Category>[];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _latestProduct = HomeGetxController().getHome() as List<Product>;

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GetBuilder<HomeGetxController>(

        builder: (controller)
    {
      if (controller.loading) {
        return Center(child: CircularProgressIndicator(),);
      }
      else if (controller.homeResponse != null) {
        return ListView(
          physics: BouncingScrollPhysics(),
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
                         //controller.homeResponse.slider,
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20.0, left: 20.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(''),
                                    fit: BoxFit.fitHeight,
                                  ),

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
                    onPressed: () {

                    }, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Category widget
                  CategoryWidget(name: 'Clothes', imageUrl: '',),

                  //CategoryWidget(),
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

                ProductWidget(name: 'test', imageUrl: '', price: 100,),


                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('Famous Products ', style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins')),
                    ProductWidget(imageUrl: 'imageUrl', price: 100, name: 'name'),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),


                Column(
                    children: [
                      ProductWidget(
                          imageUrl: 'imageUrl', price: 30, name: 'ddddddddddd')
                    ]
                )


              ],
            )
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Icon(Icons.warning, size: 80),
            Center(child: Text('No Data !', style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold),)),
          ],
        );
      }


        },

      ),
    );
  }
}
