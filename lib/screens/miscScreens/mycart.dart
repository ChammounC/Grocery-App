import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/models/DisplayCartModel.dart';
import 'package:theharmony/models/otherModels.dart';
import 'package:theharmony/screens/miscScreens/orderPlaced.dart';
import 'package:theharmony/screens/miscScreens/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../models/otherModels.dart';
import 'package:http/http.dart' as http;

import '../../provider/providers/cartItemCount.dart';
import '../../widgets/customButtons/minus.dart';
import '../../widgets/customButtons/plus.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool subscribed = false;

  bool _loaded = false;

  String txt =
      'Actual weight of Products might differ from the indicative weight,'
      'You will be billed for the actual weight delivered';

  // List<CartProduct> productList = [
  //   CartProduct(
  //       name: 'Dry Fruits',
  //       weight: '450 gm',
  //       actualPrice: '42',
  //       discountPrice: '37.30',
  //       quantity: '1',
  //       isVip: false,
  //       vipPrice: '29.40',
  //       imgsrc: 'dry1.png'),
  //   CartProduct(
  //       name: 'Special',
  //       weight: '225 gm',
  //       actualPrice: '39',
  //       discountPrice: '35',
  //       quantity: '1',
  //       isVip: false,
  //       vipPrice: '27.30',
  //       imgsrc: 'dry2.png'),
  // ];

  List<String> daysList = ['Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'];

  List<String> daysSelected = [];

  List<DisplayCartData> cartList = [];

  @override
  void initState() {
    // TODO: implement initState
    _displayCartApi(mainUserId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xfff7eee6),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.r,
              color: Colors.black,
            ),
          ),
          title: Text(
            'My Cart',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black),
          ),
        ),
        bottomNavigationBar: ConfirmButton(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              children: [
                cartList.isEmpty
                    ? _loaded
                        ? Container(
                            padding: EdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Color(0xfff7eee6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No item in Cart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Color(0xfff7eee6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Loading data... ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic),
                                ),
                                CircularProgressIndicator()
                              ],
                            ),
                          )
                    : Container(
                        height: 0.6.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color(0xfff7eee6),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartList.length,
                            itemBuilder: (context, index) {
                              return ProductCard(cartList[index],context);
                            })),
                SizedBox(
                  height: 10.h,
                ),
                //SubscribeCard(),
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
                    color: Colors.brown.withOpacity(0.2),
                  ),
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ProductCard(DisplayCartData product,BuildContext context) {
    return Container(
      width: 0.6.sw,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xfff7eee6),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.r),
                child: SizedBox(
                  width: 80.w,
                  child: Image.asset('assets/images/product1.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.6.sw,
                    child: Text(
                      '${product.name} : ${product.productId}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    product.weight,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 0.55.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹${product.itemPrice}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: Colors.black),
                                ),
                                Text(
                                  ' Our price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '₹${product.itemPrice + (product.itemPrice * 0.2).ceil().toInt()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  ' MRP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          height: 0.05.sh,
                          width: 0.2.sw,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(5.r),
                          //   color: Colors.brown.withOpacity(0.2),
                          //   border: Border.all(
                          //     color: Colors.brown,
                          //     width: 1,
                          //   ),
                          // ),
                          child: Container(
                            padding: EdgeInsets.all(6.0),
                            width: 0.2.sw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border:
                                    Border.all(color: AppColors.PRIMARY_COLOR)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {

                                    Provider.of<CartItem>(context,listen: false).decrement(product.productId);

                                    if (product.itemQuantity > 1) {
                                      // Decrease quantity of Cart Item by 1
                                      try {
                                        var params = json.encode(
                                          {
                                            "cart_id": userCartId,
                                            "user_id": mainUserId,
                                            "product_id": product.id,
                                          },
                                        );
                                        var headers = {
                                          'Authorization': 'Bearer $token',
                                          'Content-Type': 'application/json'
                                        };
                                        var response = await http.put(
                                            Uri.parse(decreaseFromCart),
                                            body: params,
                                            headers: headers);
                                        if (response.statusCode == 200) {
                                          var json = jsonDecode(response.body);
                                          if (json["status code"].toString() ==
                                              '200') {

                                          }
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "Something went wrong!!")));
                                      }
                                    } else {
                                      //Remove Item from Cart
                                      try {
                                        var params = json.encode(
                                          {
                                            "cart_id": userCartId,
                                            "user_id": mainUserId,
                                            "product_id": product.id,
                                            "item_quantity":
                                                1,
                                          },
                                        );
                                        var headers = {
                                          'Authorization': 'Bearer $token',
                                          'Content-Type': 'application/json'
                                        };
                                        var response = await http.delete(
                                            Uri.parse(removeFromCart),
                                            body: params,
                                            headers: headers);
                                        if (response.statusCode == 200) {
                                            // Provider.of<CartItem>(context,
                                            //         listen: false)
                                            //     .decrement(product.id);
                                          var json = jsonDecode(response.body);
                                          if (json["status code"].toString() ==
                                              '200') {
                                            print(
                                                'removing item: ${product.name} from cart');
                                            cartList.removeWhere((element) => element.productId==product.productId);
                                            setState(() {

                                            });
                                          }
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "Something went wrong!!")));
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 0.05.sw,
                                    width: 0.05.sw,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: AppColors.PRIMARY_COLOR,
                                        )),
                                    child: const Center(
                                      child: Icon(Icons.remove,
                                          color: AppColors.PRIMARY_COLOR,
                                          size: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 0.05.sw,
                                  child: Center(
                                    child: Text(
                                      // '${product.itemQuantity}',
                                      '${Provider.of<CartItem>(context).itemCount[product.productId]??product.itemQuantity??'0'}',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Provider.of<CartItem>(context,
                                        listen: false)
                                        .increment(product.productId);
                                    try {
                                      var params = json.encode(
                                        {
                                          "user_id": mainUserId,
                                          "product_id": product.id,
                                          "item_price": product.itemPrice,
                                          "item_quantity": 1,
                                          "discount": "20%"
                                        },
                                      );
                                      var headers = {
                                        'Authorization': 'Bearer $token',
                                        'Content-Type': 'application/json'
                                      };
                                      var response = await http.post(
                                          Uri.parse(addToCartUrl),
                                          body: params,
                                          headers: headers);
                                      if (response.statusCode == 200) {

                                        var json = jsonDecode(response.body);
                                        if (json["status code"].toString() ==
                                            '200') {
                                        }
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  "Something went wrong!!")));
                                    }
                                  },
                                  child: Container(
                                    height: 0.05.sw,
                                    width: 0.05.sw,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: AppColors.PRIMARY_COLOR,
                                        )),
                                    child: const Center(
                                        child: Icon(
                                      Icons.add,
                                      color: AppColors.PRIMARY_COLOR,
                                      size: 14,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: (){
                          //
                          //       },
                          //       child: Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 5.r),
                          //         child: Text(
                          //           '-',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.w600,
                          //               fontSize: 14.sp,
                          //               color: Colors.black),
                          //         ),
                          //       ),
                          //     ),
                          //     Text(
                          //       '${product.itemQuantity}',
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: 14.sp,
                          //           color: Colors.black),
                          //     ),
                          //     GestureDetector(
                          //       onTap: (){
                          //         // Provider.of<CartItem>(context, listen: false).increment(widget.index);
                          //       },
                          //       child: Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 5.r),
                          //         child: Text(
                          //           '+',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.w600,
                          //               fontSize: 14.sp,
                          //               color: Colors.black),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5.r),
                  //           gradient:  LinearGradient(
                  //             colors: [
                  //               Colors.orangeAccent.withOpacity(0.1),
                  //               Colors.orangeAccent.withOpacity(0.7),
                  //             ],
                  //             begin: Alignment.centerLeft,
                  //             stops: [
                  //               0.2,
                  //               0.9
                  //             ],
                  //           )
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Text('Buy this at ',
                  //             style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11.sp,
                  //                 color: Colors.black),),
                  //           Text('₹${product.vipPrice}',
                  //             style: TextStyle(fontWeight: FontWeight.w600,fontSize: 11.sp,
                  //                 color: Colors.green),),
                  //           Text(' with Subscription ',
                  //             style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11.sp,
                  //                 color: Colors.black),),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.expand_circle_down,
                size: 20.r,
                color: Colors.brown,
              )
            ],
          ),
          SubscribeCard()
        ],
      ),
    );
  }

  SubscribeCard() {
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
              Text(
                'Select your plan type',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'Daily',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: subscribed ? Colors.black : Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'One Time',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: subscribed ? Colors.black : Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'Alternate',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: subscribed ? Colors.black : Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'Custom',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: subscribed ? Colors.black : Colors.black),
                ),
              ),
            ],
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     GestureDetector(
          //       onTap: (){
          //         setState(() {
          //           subscribed = false;
          //         });
          //       },
          //       child: Row(
          //         children: [
          //           Container(
          //             width: 20.w,
          //             height: 20.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(100.r),
          //               color: Colors.white,
          //               border: Border.all(
          //                 color: subscribed
          //                     ?Colors.black : Colors.green,
          //                 width: 2
          //               )
          //             ),
          //             child: Center(
          //               child: Container(
          //                 width: 10.w,
          //                 height: 10.w,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(100.r),
          //                     color: subscribed
          //                         ?Colors.white : Colors.green
          //                 ),
          //               ),
          //             )
          //           ),
          //           Text(' One Time',
          //             style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
          //                 color: subscribed ?Colors.black : Colors.green),),
          //         ],
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: (){
          //         setState(() {
          //           subscribed = true;
          //         });
          //       },
          //       child: Row(
          //         children: [
          //           Container(
          //               width: 20.w,
          //               height: 20.w,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(100.r),
          //                   color: Colors.white,
          //                   border: Border.all(
          //                       color: subscribed
          //                           ?Colors.green : Colors.black,
          //                       width: 2
          //                   )
          //               ),
          //               child: Center(
          //                 child: Container(
          //                   width: 10.w,
          //                   height: 10.w,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(100.r),
          //                       color: subscribed
          //                           ?Colors.green : Colors.white
          //                   ),
          //                 ),
          //               )
          //           ),
          //           Text(' Custom',
          //             style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
          //                 color: subscribed ?Colors.green : Colors.black),),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 5.h,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     subscribed
          //     ?Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5.r),
          //         border: Border.all(color: Colors.grey,width: 1),
          //         color: Colors.transparent,
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.all(8.r),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text('Select Delivery Days',
          //                   style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
          //                       color: Colors.black),),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 SizedBox(
          //                   height: 40.h,
          //                   width: 0.78.sw,
          //                   child: Center(
          //                     child: ListView.builder(
          //                         shrinkWrap: true,
          //                         scrollDirection: Axis.horizontal,
          //                         itemCount: daysList.length,
          //                         itemBuilder: (context,index) {
          //                           return GestureDetector(
          //                             onTap: (){
          //                               setState(() {
          //                                 if(daysSelected.contains(daysList[index])){
          //                                   daysSelected.remove(daysList[index]);
          //                                 } else {
          //                                   daysSelected.add(daysList[index]);
          //                                 }
          //                               });
          //                             },
          //                             child: Container(
          //                               width: 30.w,
          //                               margin: EdgeInsets.all(4.r),
          //                               // padding: EdgeInsets.all(4.r),
          //                               decoration: BoxDecoration(
          //                                 borderRadius: BorderRadius.circular(5.r),
          //                                 color: daysSelected.contains(daysList[index])
          //                                       ?Colors.green.withOpacity(0.2) :Colors.white,
          //                                 border: Border.all(
          //                                   color: daysSelected.contains(daysList[index])
          //                                         ?Colors.green :Colors.grey.shade400
          //                                 )
          //                               ),
          //                               child: Center(
          //                                 child: Text(daysList[index],
          //                                   style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
          //                                       color: daysSelected.contains(daysList[index])
          //                                             ?Colors.green :Colors.grey),),
          //                               ),
          //                             ),
          //                           );
          //                         }
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     )
          //     :Expanded(
          //       child: Text('Select Subscribe to set delivery of this order on specific days of week',
          //         style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp,
          //             color: Colors.black),),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  BillCard() {
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
              Text(
                'Order Bill Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text(
                  'Mrp',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Text(
                '₹${totalMrp.toStringAsFixed(1)}',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text(
                  'Discount',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Text(
                '-₹${totalDiscount.toStringAsFixed(1)}',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.green),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text(
                  'Minimum Order Charge (if ordered below Rs. 100)',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Text(
                '₹25',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7.sw,
                child: Text(
                  'Packaging Charges',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Text(
                'Free',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ConfirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.of(context)
            //     .push(CupertinoPageRoute(builder: (context) => OrderPlaced()));
            showAlert();
          },
          child: Container(
            height: 60.h,
            width: 0.9.sw,
            margin: EdgeInsets.all(10.r),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff8c551c),
                    Color(0xff8c551c).withOpacity(0.7),
                  ],
                  begin: Alignment.centerLeft,
                  stops: [0.2, 0.9],
                )),
            child: SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: SizedBox(
                        width: 30.w,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(
                        width: 0.25.sw,
                      ),
                      Text(
                        '₹${totalAmount.toStringAsFixed(1)}', //overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  // Container(
                  //   padding: EdgeInsets.all(5.r),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(100.r),
                  //       color: Colors.white.withOpacity(0.5)),
                  //   child: Icon(
                  //     Icons.arrow_forward_ios_outlined,
                  //     size: 20.r,
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  double totalAmount = 0;
  double totalMrp = 0;
  double totalDiscount = 0;

  _displayCartApi(int userId) async {
    try {
      print('inside displayCart api');
      //setState(() {
      //_loaded = true;
      //});
      print('1.1');
      // var params =
      //   {
      //     "user_id": userId
      //   };
      // var headers = {
      //   'Authorization': 'Bearer $token',
      //   'Content-Type': 'application/json'
      // };
      // print('1.2');
      // //final uri = Uri.parse(displayCartUrl);
      // final newUri = Uri.http(displayCartUrl, '/path', params);
      // print('1.3');
      // //final newUri = uri.replace(queryParameters: params);
      // print('1.4');
      // var response =
      // await http.get(newUri, headers: headers);

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(displayCartUrl));
      request.body = json.encode({"user_id": userId});
      request.headers.addAll(headers);

      http.StreamedResponse response1 = await request.send();
      print('1.5');
      // if (kDebugMode) {
      //   print(response1.stream.bytesToString());
      // }
      print('1.6');
      var response = await response1.stream.bytesToString();

      if (response1.statusCode == 200) {
        var json = jsonDecode(response);
        if (json["status code"].toString() == '200') {
          print('success.');

          var data = DisplayCartModel.fromJson(json);

          cartList = data.data;

          for (int i = 0; i < cartList.length; i++) {
            totalMrp =
                totalMrp + (cartList[i].itemPrice * cartList[i].itemQuantity);
            totalDiscount = totalDiscount +
                ((cartList[i].itemPrice - (cartList[i].itemPrice * 0.8)) *
                    cartList[i].itemQuantity);
          }

          totalAmount = totalMrp - totalDiscount;

          print('data fetched');

          setState(() {
            _loaded = true;
          });

          FocusScopeNode().unfocus();
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            _loaded = true;
            //_isLoading = false;
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          _loaded = true;
          //_isLoading = false;
        });
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        _loaded = true;
        //_isLoading = false;
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
    }
  }

  bool _placingOrder = false;

  showAlert() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: _placingOrder
              ? Text('Placing your order...')
              : Text('Place Order'),
          content:
              _placingOrder ? Text('Please wait...') : Text('Please Confirm'),
          actions: _placingOrder
              ? []
              : [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    //return false when click on "NO"
                    child: Text('Later'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _placingOrder = true;
                        //FocusScope.of(context).unfocus();
                      });
                      //Navigator.of(context).pop(true);
                      FocusScope.of(context).unfocus();

                      _placeOrderApi(mainUserId);
                      // final SharedPreferences prefs =
                      // await SharedPreferences.getInstance();
                      // prefs.clear();
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                    },
                    //return true when click on "Yes"
                    child: Text('Order'),
                  ),
                ],
        ),
      ),
    );
  }

  _placeOrderApi(
    userId,
  ) async {
    try {
      print('inside place order api');
      // setState(() {
      //   _isLoading = true;
      // });
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var request = http.MultipartRequest('POST', Uri.parse(placeOrderUrl));
      request.fields.addAll({
        'userId': userId.toString(),
        'transactionId': '4512',
        'transactionType': '2',
        'amount': totalAmount.toString(),
        'items': cartList.length.toString(),
        'orderType': '1',
        'deliveryAddress': 'delhi NCR',
        'city': 'delhi',
        'state': 'delhi',
        'pin': '1100251',
        'subscriptionId': '1234'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response1 = await request.send();

      var response = await response1.stream.bytesToString();
      // if (kDebugMode) {
      //   print(response.body);
      // }

      if (response1.statusCode == 200) {
        var json = jsonDecode(response);
        if (json["status code"].toString() == '200') {
          print('success otp sent.');

          print('data fetched');

          setState(() {
            _placingOrder = true;
          });

          FocusScopeNode().unfocus();
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OrderPlaced()),
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(json["message"].toString())));
        } else {
          setState(() {
            _placingOrder = true;
          });
          Navigator.pop(context);
          showFailed();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          _placingOrder = true;
        });
        Navigator.pop(context);
        showFailed();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something went wrong !!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        _placingOrder = true;
      });
      Navigator.pop(context);
      showFailed();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Something went wrong !!")));
    }
  }

  showFailed() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text('Order Failed'),
          content: Text('Please try again later...'),
          actions: _placingOrder
              ? []
              : [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    //return false when click on "NO"
                    child: Text('Ok'),
                  ),
                ],
        ),
      ),
    );
  }
}
