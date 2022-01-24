// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:shopper_project2/get/favorite_getx_controller.dart';
// import 'package:shopper_project2/models/product.dart';
// import 'package:shopper_project2/screens/product_details_screen.dart';
//
// class ProductWidget extends StatefulWidget {
//   // String imageUrl ;
//   // String name ;
//   // int price;
//   //
//   // Function function;
//   final List<Product> products;
//   ProductWidget({required this.products});
//
//   @override
//   State<ProductWidget> createState() => _ProductWidgetState();
// }
//
// class _ProductWidgetState extends State<ProductWidget> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<FavoriteGetXController>(
//       builder: (controller){
//         return ListView.builder(
//           itemCount: widget.products.length,
//           itemBuilder: (context , index){
//             return GestureDetector(
//               onTap: (){
//                 // navigate to product details
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(id:widget.products[index].id)));
//               },
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white, borderRadius: BorderRadius.circular(15)),
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     // width: MediaQuery.of(context).size.width,
//                     width: 230.h,
//                     // height: 220,
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: CachedNetworkImage(
//                             //width: 200,
//
//                             imageUrl: widget.products[index].imageUrl,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         // SizedBox(
//                         //   height: 10.h,
//                         // ),
//                         Container(
//                           height: 40.h,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                   child: Text(
//                                     widget.products[index].nameEn,
//                                     style: TextStyle(color: Colors.black, fontFamily: 'Poppins' , fontWeight: FontWeight.bold),
//                                   )),
//                               Spacer(),
//                               Text(
//
//                                 widget.products[index].price.toString()+'\$',
//
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins' ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//
//                     ),
//                   ),
//                   Positioned.fill(child: Container(
//                     margin: EdgeInsets.all(10.0),
//                     child: Align(alignment: AlignmentDirectional.topEnd,
//                         child: Column(children: [
//                           IconButton(
//                             onPressed: () async{
//                           await changeFavorite(id: widget.products[index].id, product: widget.products[index]);
//                             },
//                             icon: Icon(
//                               Icons.favorite,
//
//                               color: changeFavoriteColor(status: widget.products[index].isFavorite),
//                               size: 30,
//                             ),
//                           ),
//
//                         ],)
//                     ),
//                   ))
//                 ],
//               ),
//             );
//           },
//
//         );
//       }
//
//     );
//   }
//   Future<void> changeFavorite({required int id , required Product product}) async{
//     await FavoriteGetXController.to.changeFavorite(context, id: id, product: product);
//
//   }
//   Color changeFavoriteColor({required bool status}){
//     Color color = FavoriteGetXController.to.changeFavoriteColor(isFavorite: status);
//     return color;
//   }
// }
