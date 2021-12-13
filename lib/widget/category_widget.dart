import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryWidget extends StatelessWidget {
  String imageUrl ;
  String name;
   CategoryWidget({
    Key? key,
   required  this.name,
     required this.imageUrl

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // navigate to sub categories
      },
      child: Container(
          width: 150.w,
          height: 88.h,
          decoration: BoxDecoration(color: Colors.grey.shade200 , borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Text(name , style: TextStyle(fontSize: 14.sp,fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
            Spacer(),
            Image.network(imageUrl, width: 52.w,height:52.h,fit: BoxFit.cover,)
          ],)
      ),
    );
  }
}