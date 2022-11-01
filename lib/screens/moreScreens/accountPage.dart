import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/screens/authScreens/login.dart';
import 'package:theharmony/screens/moreScreens/myProfile.dart';
import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  bool ringBell = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff7eee6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.grey,),
          ),
          centerTitle: true,
          title: Text('Account & Preferences',
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
                color: Colors.black),),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              SizedBox(height: 5.h,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1
                    )
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) => MyProfile())
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('My Profile',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.62.sw,
                                        child: Text('Edit',//overflow: TextOverflow.visible,
                                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                                              color: Colors.black),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,size: 20.r,color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Divider(color: Colors.grey.shade400,thickness: 1,),
                    // GestureDetector(
                    //   onTap: (){},
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
                    //     child: SizedBox(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   Text('Address',
                    //                     style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                    //                         color: Colors.black),),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 //mainAxisAlignment: MainAxisAlignment.start,
                    //                 //crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   SizedBox(
                    //                     width: 0.76.sw,
                    //                     child: Text('Sarkar nath road, Ichapur Kolkata, '
                    //                         'Barrackpore chiria More, West Bengal',//overflow: TextOverflow.visible,
                    //                       style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                    //                           color: Colors.black),),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           Icon(Icons.arrow_forward_ios_outlined,size: 20.r,color: Colors.grey,)
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Text('Dairy Products',
                    style: TextStyle(fontSize: 14.sp,color: Colors.black,
                        fontWeight: FontWeight.w600),)
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1
                    )
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Delivery time slot',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.62.sw,
                                        child: Text('Morning (5:00 AM - 7:30 AM)',//overflow: TextOverflow.visible,
                                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                                              color: Colors.black),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,size: 20.r,color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey.shade400,thickness: 1,),
                    GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Ring the Bell',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.62.sw,
                                        child: Text(ringBell?'Yes':'No',//overflow: TextOverflow.visible,
                                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                                              color: Colors.black),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CupertinoSwitch(value: ringBell, onChanged: (x){setState(() {
                                ringBell = !ringBell;
                              });})
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey.shade400,thickness: 1,),
                    GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Add instructions',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.62.sw,
                                        child: Text('Not Added',//overflow: TextOverflow.visible,
                                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                                              color: Colors.black),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    )
                                ),
                                child: Text('Add',//overflow: TextOverflow.visible,
                                  style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,
                                      color: Colors.green),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
