import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {

  ProductWidget();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                   imageUrl: 'product.image',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          'Product name ',
                          style: TextStyle(color: Colors.black),
                        )),
                    Spacer(),
                    Text(
                      'Price',
                      //product.price.toString()+'\$',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],

          ),
        ),
        Positioned.fill(child: Container(
          margin: EdgeInsets.all(10.0),
          child: Align(alignment: Alignment.topLeft,
              child: Column(children: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.purple,
                    size: 30,
                  ),
                ),

              ],)
          ),
        ))
      ],
    );
  }
}
