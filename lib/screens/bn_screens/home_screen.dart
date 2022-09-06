import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopper_project2/api/controller/home_api_controller.dart';
import 'package:shopper_project2/get/favorite_getx_controller.dart';
import 'package:shopper_project2/get/home_getx_controller.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/home_response.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/screens/bn_screens/sub_categories_screen.dart';
import 'package:shopper_project2/widget/category_widget.dart';
import 'package:shopper_project2/widget/product_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../product_details_screen.dart';
import 'categories_screen.dart';
enum ProductType{latest , famous}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FavoriteGetXController _favoriteGetXController = Get.put(FavoriteGetXController());
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());
  // List<Product> _latestProduct = <Product>[];
  // List<Product> _famousProduct = <Product>[];
  // List<Slider> _slider = <Slider> [];
  List<Category> _categories = <Category>[];
  List<Product> product = <Product>[];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    HomeGetxController().getHome() ;

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
                Column(
                  children: [
                    Text(
                     ' AppLocalizations.of(context)!.home',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 10,),
                    Positioned(
                      top: 60.h,
                      bottom: 20.h,
                      right: 50,
                      left: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Color(0xffE2E2E2),
                          borderRadius: BorderRadius.circular(20),),
                        height: 150.h,
                        width: 500.w,
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 202.h,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            initialPage: 2,
                          ),
                          itemCount: controller.homeResponse!.slider.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Image.network(
                                  controller
                                      .homeResponse!.slider[itemIndex].imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                        ),
                      ),
                    ),
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
                    Text(
                      'AppLocalizations.of(context)!.categories',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          const CategoriesScreen(),
                        );
                      },
                      child: const Text(
                        'see all -->',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.homeResponse!.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(
                          SubCategoriesScreen(
                            id: controller.homeResponse!.categories[index].id,
                          ),
                        ),
                        // Navigator.pushNamed(context, '/categories_screen'),
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          height: 140,
                          width: 140,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller
                                    .homeResponse!.categories[index].imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.4),
                                alignment: Alignment.center,
                                height: 60,
                                child: Text(
                                  controller
                                      .homeResponse!.categories[index].nameEn,
                                  style:const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'AppLocalizations.of(context)!.latestProduct',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
               const SizedBox(
                  height:10,
                ),

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 250,
                          width: 180,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.homeResponse!
                                        .latestProducts[index].imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: Text(
                                        controller.homeResponse!
                                            .latestProducts[index].nameEn,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Center(
                                      child: Text('${controller.homeResponse!
                                          .latestProducts[index].price
                                          .toString()} \$'

                                        ,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'AppLocalizations.of(context)!.famousProduct',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    //itemCount: controller.homeResponse!.categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:const EdgeInsets.only(right: 15),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 250,
                          width: 180,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/FavoriteScreen');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.homeResponse!
                                        .famousProducts[index].imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(
                                      controller.homeResponse!
                                          .famousProducts[index].nameEn,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Center(
                                    child: Text('${controller.homeResponse!
                                        .famousProducts[index].price
                                        .toString()} \$'

                                      ,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      //   ProductWidget(
                      //   name: controller
                      //       .homeResponse!.famousProducts[index].nameEn,
                      //   imageUrl: controller
                      //       .homeResponse!.famousProducts[index].imageUrl,
                      //   price: controller
                      //       .homeResponse!.famousProducts[index].price,
                      // );
                    },
                  ),
                ),
              ],
            );
            // return ListView(
            //   physics: BouncingScrollPhysics(),
            //   children: [
            //     Stack(
            //       children: [
            //         Container(
            //           padding: const EdgeInsets.only(top: 30, left: 20),
            //           alignment: AlignmentDirectional.topStart,
            //           height: 300.h,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //               borderRadius: const BorderRadius.only(
            //                   bottomLeft: Radius.circular(25),
            //                   bottomRight: Radius.circular(25)),
            //               color: HexColor('#01221D')),
            //           child: Text(AppLocalizations.of(context)!.home,
            //               style: TextStyle(
            //                   fontSize: 22.sp,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontFamily: 'Poppins')),
            //         ),
            //         Positioned(
            //             top: 60.h,
            //             bottom: 20.h,
            //             right: 50,
            //             left: 50,
            //             child: Container(
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(20)),
            //                 height: 150.h,
            //                 width: 500.w,
            //                 child: CarouselSlider.builder(
            //                   options: CarouselOptions(
            //                     height: 202.h,
            //                     autoPlay: true,
            //                     enlargeCenterPage: true,
            //                     viewportFraction: 0.9,
            //                     aspectRatio: 2.0,
            //                     initialPage: 2,
            //                   ),
            //                   itemCount: controller.homeResponse!.slider.length,
            //                   itemBuilder: (BuildContext context, int itemIndex,
            //                       int pageViewIndex) =>
            //                       Container(
            //                         //clipBehavior: Clip.antiAlias,
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(20)),
            //                         //height: 202.h,
            //                         width: 200.w,
            //                         child: Image.network(
            //                           controller.homeResponse!.slider[itemIndex].imageUrl,
            //                           fit: BoxFit.fitWidth,
            //                         ),
            //                       ),
            //                 )
            //
            //             )),
            //       ],
            //     ),
            //     SizedBox(
            //       height: 20.h,
            //     ),
            //     Row(
            //       children: [
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         Text(AppLocalizations.of(context)!.categories,
            //             style: TextStyle(
            //                 fontSize: 20.sp,
            //                 fontWeight: FontWeight.bold,
            //                 fontFamily: 'Poppins')),
            //         Spacer(),
            //         IconButton(
            //             onPressed: () {
            //
            //             }, icon: Icon(Icons.arrow_forward_ios))
            //       ],
            //     ),
            //     Container(
            //
            //       height: 100,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: controller.homeResponse!.categories.length,
            //         itemBuilder: (context, index) {
            //
            //           return  InkWell(
            //               onTap: (){
            //                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoriesScreen(id: _categories[index].id)));
            //               },
            //               child: CategoryWidget(name: controller.homeResponse!.categories[index].nameEn, imageUrl: controller.homeResponse!.categories[index].imageUrl,));
            //         },),
            //     ),
            //     // SingleChildScrollView(
            //     //   padding: EdgeInsets.all(20),
            //     //   scrollDirection: Axis.horizontal,
            //     //   child: Row(
            //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     //     children: [
            //     //       //Category widget
            //     //       CategoryWidget(name: 'Clothes', imageUrl: '',),
            //     //
            //     //       //CategoryWidget(),
            //     //     ],
            //     //   ),
            //     // ),
            //     SizedBox(
            //       height: 20.h,
            //     ),
            //     Row(
            //       children: [
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         Text(AppLocalizations.of(context)!.latestProduct,
            //             style: TextStyle(
            //                 fontSize: 20.sp,
            //                 fontWeight: FontWeight.bold,
            //                 fontFamily: 'Poppins')),
            //         Spacer(),
            //         IconButton(
            //             onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
            //       ],
            //     ),
            //     Container(
            //       height: 200,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: controller.homeResponse!.categories.length,
            //         itemBuilder: (context, index) {
            //           // return  ProductWidget(name: controller.homeResponse!.latestProducts[index].nameEn, imageUrl: controller.homeResponse!.latestProducts[index].imageUrl, price: controller.homeResponse!.latestProducts[index].price,function: () {
            //           // //  await favoriteProduct(productType:ProductType.latest, index: index);
            //           // },);
            //           return GestureDetector(
            //             onTap: (){
            //               // navigate to product details
            //               Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product[index])));
            //
            //             },
            //             child: Stack(
            //               children: [
            //                 Container(
            //                   decoration: BoxDecoration(
            //                       color: Colors.white, borderRadius: BorderRadius.circular(15)),
            //                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //                   // width: MediaQuery.of(context).size.width,
            //                   width: 230.h,
            //                   // height: 220,
            //                   child: Column(
            //                     children: [
            //                       Expanded(
            //                         child: CachedNetworkImage(
            //                           //width: 200,
            //
            //                           imageUrl: controller.homeResponse!.latestProducts[index].imageUrl,
            //                           fit: BoxFit.contain,
            //                         ),
            //                       ),
            //                       // SizedBox(
            //                       //   height: 10.h,
            //                       // ),
            //                       Container(
            //                         height: 40.h,
            //                         child: Row(
            //                           children: [
            //                             Expanded(
            //                                 child: Text(
            //                                   controller.homeResponse!.famousProducts[index].nameEn,
            //                                   style: TextStyle(color: Colors.black, fontFamily: 'Poppins' , fontWeight: FontWeight.bold),
            //                                 )),
            //                             Spacer(),
            //                             Text(
            //
            //                               controller.homeResponse!.latestProducts[index].price.toString()+'\$',
            //
            //                               style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins' ),
            //                             )
            //                           ],
            //                         ),
            //                       )
            //                     ],
            //
            //                   ),
            //                 ),
            //                 Positioned.fill(child: Container(
            //                   margin: EdgeInsets.all(10.0),
            //                   child: Align(alignment: AlignmentDirectional.topEnd,
            //                       child: Column(children: [
            //                         IconButton(
            //                           onPressed: (){
            //
            //                           },
            //                           icon: Icon(
            //                             Icons.favorite,
            //                             //color: FavoriteGetXController.to.isFavorite(product!.id)? Colors.red: Colors.grey,
            //                             color: Colors.red,
            //                             size: 30,
            //                           ),
            //                         ),
            //
            //                       ],)
            //                   ),
            //                 ))
            //               ],
            //             ),
            //           );
            //         },),
            //     ),
            //     Row(
            //       children: [
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         Text(AppLocalizations.of(context)!.latestProduct, style: TextStyle(
            //             fontSize: 20.sp,
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Poppins')),
            //         Spacer(),
            //         IconButton(
            //             onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
            //       ],
            //     ),
            //     Container(
            //
            //       height: 200.h,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: controller.homeResponse!.categories.length,
            //         itemBuilder: (context, index) {
            //           //  return  ProductWidget(name: controller.homeResponse!.famousProducts[index].nameEn, imageUrl: controller.homeResponse!.famousProducts[index].imageUrl, price: controller.homeResponse!.famousProducts[index].price, function: (){
            //           // // await favoriteProduct(productType:ProductType.famous, index: index);
            //           //  },);
            //
            //           return GestureDetector(
            //             onTap: (){
            //               // navigate to product details
            //               Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product[index])));
            //
            //             },
            //             child: Stack(
            //               children: [
            //                 Container(
            //                   decoration: BoxDecoration(
            //                       color: Colors.white, borderRadius: BorderRadius.circular(15)),
            //                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //                   // width: MediaQuery.of(context).size.width,
            //                   width: 230.h,
            //                   // height: 220,
            //                   child: Column(
            //                     children: [
            //                       Expanded(
            //                         child: CachedNetworkImage(
            //                           //width: 200,
            //
            //                           imageUrl: controller.homeResponse!.famousProducts[index].imageUrl,
            //                           fit: BoxFit.contain,
            //                         ),
            //                       ),
            //                       // SizedBox(
            //                       //   height: 10.h,
            //                       // ),
            //                       Container(
            //                         height: 40.h,
            //                         child: Row(
            //                           children: [
            //                             Expanded(
            //                                 child: Text(
            //                                   controller.homeResponse!.famousProducts[index].nameEn,
            //                                   style: TextStyle(color: Colors.black, fontFamily: 'Poppins' , fontWeight: FontWeight.bold),
            //                                 )),
            //                             Spacer(),
            //                             Text(
            //
            //                               controller.homeResponse!.famousProducts[index].price.toString()+'\$',
            //
            //                               style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins' ),
            //                             )
            //                           ],
            //                         ),
            //                       )
            //                     ],
            //
            //                   ),
            //                 ),
            //                 Positioned.fill(child: Container(
            //                   margin: EdgeInsets.all(10.0),
            //                   child: Align(alignment: AlignmentDirectional.topEnd,
            //                       child: Column(children: [
            //                         IconButton(
            //                           onPressed: (){
            //
            //                           },
            //                           icon: Icon(
            //                             Icons.favorite,
            //                             //color: FavoriteGetXController.to.isFavorite(product.id)? Colors.red: Colors.grey,
            //                             color: Colors.red,
            //                             size: 30,
            //                           ),
            //                         ),
            //
            //                       ],)
            //                   ),
            //                 ))
            //               ],
            //             ),
            //           );
            //         },),
            //     ),
            //     //Product Widget
            //
            //   ],
            // );
          }
          else {
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



  Future<void> favoriteProduct ({required ProductType productType , required int index , }) async{
    var product = ProductType == ProductType.famous ? _homeGetxController.homeResponse!.famousProducts[index] : _homeGetxController.homeResponse!.latestProducts[index];
    product.isFavorite = FavoriteGetXController.to.isFavorite(product.id);
    await FavoriteGetXController.to.updateFavorite(context: context, product: product);
    setState(() {

    });


  }
}