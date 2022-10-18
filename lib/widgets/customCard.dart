import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String name;
  const CustomCard(
      {required this.imageUrl,
      required this.price,
      required this.name,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:5,top:5,bottom:5),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(color: Colors.grey.withOpacity(0.2))
      ),
      height: 0.2.sh,
      width: 0.4.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex:4,
            child: Image.asset(imageUrl),
          ),
          SizedBox(height: 12.sp,),
          Flexible(
            flex:1,
            child: Padding(padding:EdgeInsets.only(left:10.sp),child: Text(name,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: 3.sp,),
          Flexible(
            flex:1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding:EdgeInsets.only(left:10.sp),child: Text('\u{20B9} $price',style: TextStyle(fontSize: 14.sp,color: Colors.grey),)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),),
                      // border: Border.all(
                      //     color: AppColors.PRIMARY_COLOR
                      // ),
                    color: AppColors.PRIMARY_COLOR
                  ),
                  width: 0.045.sh,
                  height:0.04.sh,
                  child: Center(
                    child: Icon(Icons.add,color:Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
