import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/models/getMyOrdersModel.dart';
import 'package:theharmony/screens/productScreen/productDetailPage.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  final GetMyOrderData myOrderDetail;
  const OrderHistoryDetailPage({Key? key, required this.myOrderDetail}) : super(key: key);

  @override
  State<OrderHistoryDetailPage> createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  
  List<String> imgList =[
    'assets/images/dairy01.png',
    'assets/images/nut01.png',
    'assets/images/nut03.png',
    'assets/images/dairy03.png',
    'assets/images/product1.png',
    'assets/images/fruit01.png',
    'assets/images/product2.png',
    'assets/images/nut02.png',
    'assets/images/fruit03.png',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7eee6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey,size: 30.r,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text('Order Details',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
              color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            Row(
              children: [
                Text('Order ID - ${widget.myOrderDetail.id}',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                      color: Colors.black),),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Special Nuts Box',
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
                          color: Colors.black),),
                    SizedBox(height: 5.h,),
                    Text('₹ ${widget.myOrderDetail.amount}',
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5.r),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(
                      //   CupertinoPageRoute(builder: (context) =>
                      //       ProductDetailPage(itemDetails: {
                      //         'productName': 'Special Nuts Box',
                      //         'price': '302',
                      //         'weight': '200 gm',
                      //         'imgUrl': 'assets/images/product2.png'
                      //       }, index: 0))
                      // );
                    },
                    child: SizedBox(
                      height: 100.w,
                      width: 100.w,
                      child: Image.asset('assets/images/nut02.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.green.withOpacity(0.4),
                    border: Border.all(
                      color: Colors.grey.shade400
                    )
                  ),
                  child: Row(
                    children: [
                      Text('Order Delivered',
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                            color: Colors.black),),
                      SizedBox(width: 5.w,),
                      Icon(Icons.check_circle_rounded,color: Colors.blue,size: 20.r,)
                    ],
                  )
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            Row(
              children: [
                Icon(Icons.star,color: Colors.green,size: 30.r,),
                Icon(Icons.star,color: Colors.green,size: 30.r,),
                Icon(Icons.star,color: Colors.green,size: 30.r,),
                Icon(Icons.star,color: Colors.green,size: 30.r,),
                Icon(Icons.star,color: Colors.grey,size: 30.r,),
                Spacer(),
                Text('Write a Review',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                      color: Colors.blue),),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Need help?',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp,
                      color: Colors.black),),
                Text('Cancel Order',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp,
                      color: Colors.black),),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text('You may also like',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp,
                      color: Colors.black),),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: imgList.length,
                  itemBuilder: (context,index) {
                return PhysicalModel(color: Colors.transparent,
                elevation: 5,shadowColor: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white,
                  ),
                  //height: 95.w,
                  width: 100.w,
                  child: Image.asset(imgList[index]),
                ));
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 15.w,);
              },),
            ),
            SizedBox(height: 20.h,
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),),
            Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Shipping Details :',
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp,
                            color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.8.sw,
                        child: Text('Sarkar nath road, Ichapur Kolkata, '
                            'Barrackpore chiria More, West Bengal',//overflow: TextOverflow.visible,
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                              color: Colors.black),),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.8.sw,
                        child: Text('Phone number: 784152395',//overflow: TextOverflow.visible,
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                              color: Colors.black),),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
