import 'package:theharmony/models/cartproduct.dart';
import 'package:theharmony/screens/miscScreens/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/cartproduct.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {

  bool subscribed = false;

  String txt = 'Actual weight of Products might differ from the indicative weight,'
      'You will be billed for thr actual weight delivered';

  List<CartProduct> productList = [
    CartProduct(
        name: 'Dry Fruits',
        weight: '450 gm',
        actualPrice: '42',
        discountPrice: '37.30',
        quantity: '1',
        isVip: false,
        vipPrice: '29.40',
        imgsrc: 'dry1.png'
    ),
    CartProduct(
        name: 'Special',
        weight: '225 gm',
        actualPrice: '39',
        discountPrice: '35',
        quantity: '1',
        isVip: false,
        vipPrice: '27.30',
        imgsrc: 'dry2.png'
    ),
  ];

  List<String> daysList = [
    'Su','M','Tu','W','Th','F','Sa'
  ];

  List<String> daysSelected = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xfff7eee6),
          elevation: 0,
          leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new,size: 20.r, color: Colors.black,),
          ),
          title: Text('My Cart',
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
                color: Colors.black),),
        ),
        bottomNavigationBar: ConfirmButton(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color(0xfff7eee6),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productList.length,
                        itemBuilder: (context,index) {
                          return ProductCard(productList[index]);
                        }
                    )
                  ),
                SizedBox(
                  height: 10.h,
                ),
                SubscribeCard(),
                SizedBox(
                  height: 10.h,
                ),
                BillCard(),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: Text(txt, textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp,
                        color: Colors.black,fontStyle: FontStyle.italic),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ProductCard(CartProduct product){
    return Container(
      width: 0.6.sw,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xfff7eee6),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.r),
            child: SizedBox(
              width: 80.w,
              child: Image.asset('assets/images/${product.imgsrc}'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name,
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                    color: Colors.black),),
              Text(product.weight,
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11.sp,
                    color: Colors.grey),),
              SizedBox(height: 5.h,),
              SizedBox(
                width: 0.55.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('₹${product.discountPrice}',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                              color: Colors.black),),
                        Text('₹${product.actualPrice}',
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                              color: Colors.grey,decoration: TextDecoration.lineThrough),),
                      ],
                    ),
                    Container(
                      height: 30.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.green.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.green,
                          width: 1,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.r),
                            child: Text('-',
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                  color: Colors.green),),
                          ),
                          Text('${product.quantity}',
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                color: Colors.green),),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.r),
                            child: Text('+',
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                  color: Colors.green),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                        gradient:  LinearGradient(
                          colors: [
                            Colors.orangeAccent.withOpacity(0.1),
                            Colors.orangeAccent.withOpacity(0.7),
                          ],
                          begin: Alignment.centerLeft,
                          stops: [
                            0.2,
                            0.9
                          ],
                        )
                    ),
                    child: Row(
                      children: [
                        Text('Buy this at ',
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11.sp,
                              color: Colors.black),),
                        Text('₹${product.vipPrice}',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 11.sp,
                              color: Colors.green),),
                        Text(' with Subscription ',
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11.sp,
                              color: Colors.black),),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  SubscribeCard(){
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xfff7eee6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Select Subscription',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp,
                    color: Colors.black),),
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    subscribed = false;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: Colors.white,
                        border: Border.all(
                          color: subscribed
                              ?Colors.black : Colors.green,
                          width: 2
                        )
                      ),
                      child: Center(
                        child: Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: subscribed
                                  ?Colors.white : Colors.green
                          ),
                        ),
                      )
                    ),
                    Text(' One Time',
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                          color: subscribed ?Colors.black : Colors.green),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    subscribed = true;
                  });
                },
                child: Row(
                  children: [
                    Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Colors.white,
                            border: Border.all(
                                color: subscribed
                                    ?Colors.green : Colors.black,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: subscribed
                                    ?Colors.green : Colors.white
                            ),
                          ),
                        )
                    ),
                    Text(' Subscribe',
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                          color: subscribed ?Colors.green : Colors.black),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              subscribed
              ?Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Colors.grey,width: 1),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Delivery Days',
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                color: Colors.black),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 0.8.sw,
                            child: Center(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: daysList.length,
                                  itemBuilder: (context,index) {
                                    return GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(daysSelected.contains(daysList[index])){
                                            daysSelected.remove(daysList[index]);
                                          } else {
                                            daysSelected.add(daysList[index]);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 30.w,
                                        margin: EdgeInsets.all(4.r),
                                        // padding: EdgeInsets.all(4.r),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.r),
                                          color: daysSelected.contains(daysList[index])
                                                ?Colors.green.withOpacity(0.2) :Colors.white,
                                          border: Border.all(
                                            color: daysSelected.contains(daysList[index])
                                                  ?Colors.green :Colors.grey.shade400
                                          )
                                        ),
                                        child: Center(
                                          child: Text(daysList[index],
                                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                                                color: daysSelected.contains(daysList[index])
                                                      ?Colors.green :Colors.grey),),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
              :Expanded(
                child: Text('Select Subscribe to set delivery of this order on specific days of week',
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp,
                      color: Colors.black),),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BillCard(){
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xfff7eee6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Order Bill Details',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp,
                    color: Colors.black),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text('Mrp',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                      color: Colors.black),),
              ),
              Text('₹81',
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                    color: Colors.black),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text('Discount',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                      color: Colors.black),),
              ),
              Text('-₹8.70',
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                    color: Colors.green),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text('Minimum Order Charge (if ordered below Rs. 100)',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                      color: Colors.black),),
              ),
              Text('₹25',
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                    color: Colors.black),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text('Packaging Charges',
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                      color: Colors.black),),
              ),
              Text('Free',
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                    color: Colors.green),),
            ],
          ),
        ],
      ),
    );
  }

  ConfirmButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => Wallet())
            );
          },
          child: Container(
            height: 60.h,
            width: 0.9.sw,
            margin: EdgeInsets.all(10.r),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
                gradient:  LinearGradient(
                  colors: [
                    Color(0xff8c551c),
                    Color(0xff8c551c).withOpacity(0.7),
                  ],
                  begin: Alignment.centerLeft,
                  stops: [
                    0.2,
                    0.9
                  ],
                )
            ),
            child: SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: SizedBox(
                      width: 30.w,
                      child: Icon(Icons.shopping_cart,color: Colors.white,size: 30,)
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Total Non-Member Price',
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                color: Colors.white.withOpacity(0.5)),),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 0.62.sw,
                            child: Text('₹97.30',//overflow: TextOverflow.visible,
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                  color: Colors.white),),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Colors.white.withOpacity(0.5)
                    ),
                    child: Icon(Icons.arrow_forward_ios_outlined,size: 20.r,color: Colors.white,),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
