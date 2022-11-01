import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/main.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.of(context).push(
        //       CupertinoPageRoute(builder: (context) => HomePage())
        //     );
        //   }, icon: Icon(Icons.close,size: 20.r,color: Colors.white,),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_rounded,color: Colors.green,size: 100.h,)
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Placed',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 34.sp,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your order was placed successfully\n'
                      'order will be delivered on\n'
                      '2nd November, 2022\n'
                      'for more details,\n'
                      'check delivery status\n', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhysicalModel(
                  color: Colors.transparent,
                  elevation: 5,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(15.r),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(
                      //   CupertinoPageRoute(builder: (context) => HomePage())
                      // );
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.r,vertical: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.brown.shade900,
                          width: 1
                        )
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
