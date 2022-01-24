import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopper_project2/api/controller/home_api_controller.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/widget/custom_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({required this.product});


  final Product product;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Future<Product?> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future =
        HomeApiController().getProductDetails(widget.product.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.nameEn,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: FutureBuilder<Product?>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 180.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            snapshot.data!.images[0].imageUrl,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          Image.network(snapshot.data!.images[1].imageUrl),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 180.h,
                          // width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          Image.network(snapshot.data!.images[2].imageUrl),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(snapshot.data!.nameEn,
                          style: TextStyle(
                              fontSize: 22.sp,
                              letterSpacing: 2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700)),
                      Text('${snapshot.data!.price} \$ ',
                          style: TextStyle(
                              fontSize: 25.sp,
                              letterSpacing: 2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Text(
                      ' Product info:',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      snapshot.data!.infoEn,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.favorite),
                        iconSize: 40,
                        color: Colors.red,
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomButton(
                          onPress: () {},
                          text: 'Buy Now',
                          color: HexColor("#07BFA5")),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        iconSize: 35,
                        color: HexColor("#07BFA5"),
                      )
                    ],
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('NO DATA'),
              );
            }
          }),
    );
  }
}