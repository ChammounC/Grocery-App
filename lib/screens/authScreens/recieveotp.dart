import 'package:theharmony/main.dart';
import 'package:theharmony/screens/miscScreens/mycart.dart';
import 'package:theharmony/screens/authScreens/login.dart';
import 'package:theharmony/screens/moreScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecieveOtp extends StatefulWidget {
  const RecieveOtp({Key? key}) : super(key: key);

  @override
  State<RecieveOtp> createState() => _RecieveOtpState();
}

class _RecieveOtpState extends State<RecieveOtp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 1.sh,
                        width: 0.5.sw,
                        color: Color(0xffab6926),
                      ),
                      Container(
                        height: 1.sh,
                        width: 0.5.sw,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 0.5.sh,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100.r),
                            ),
                            gradient:  LinearGradient(
                              colors: [
                                Color(0xff8c551c),
                                Color(0xffd68633),
                              ],
                              begin: Alignment.topLeft,
                              stops: [
                                0.2,
                                0.9
                              ],
                            )
                        ),
                      ),
                      Container(
                        height: 0.5.sh,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.r),
                            ),
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Log in',
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28.sp,
                                color: Colors.white),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 0.55.sh,
                            width: 0.9.sw,
                            child: Image.asset('assets/images/nut03.png'),
                          )
                        ],
                      ),
                      SizedBox(height: 0.01.sh,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.r),
                            child: Text('Enter the OTP sent to your number',
                              style: TextStyle(fontSize: 18.sp,color: Colors.black,
                                  fontWeight: FontWeight.w400),),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.01.sh,),
                      Container(
                        height: 40.h,
                        width: 0.9.sw,
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5.r)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  const [
                            Expanded(
                              flex: 3,
                              child: TextField(
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "",
                                    enabledBorder: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:0.01.sh,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.r),
                            child: Text('Change number?',
                              style: TextStyle(fontSize: 16.sp,color: Colors.blue,
                                  fontWeight: FontWeight.w400),),),
                          )
                        ],
                      ),
                      SizedBox(height:0.02.sh,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PhysicalModel(
                            color: Colors.white,
                            shadowColor: Colors.blue,
                            elevation: 8.r,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    CupertinoPageRoute(builder: (context) => HomePage())
                                );
                              },
                              child: Container(
                                width: 0.9.sw,
                                padding: EdgeInsets.symmetric(vertical: 12.r,horizontal: 10.r),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(2.r),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Log In',
                                      style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                                    //Icon(Icons.arrow_forward_ios,size: 20.r,),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: 0.03.sh,),
                      // SizedBox(
                      //   //width: mediaWidth(context, 1),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       SizedBox(
                      //         width: 0.9.sw,
                      //         child: Divider(
                      //           height: 2.r,thickness: 1.r,color: Colors.grey,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 10.w,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('Already have an Account?',
                      //       style: GoogleFonts.lato(fontSize: 16.sp,color: Colors.black,
                      //           fontWeight: FontWeight.w300),),
                      //     GestureDetector(
                      //       onTap: (){
                      //         Navigator.pop(context);
                      //         // Navigator.of(context).push(
                      //         //     CupertinoPageRoute(builder: (context) => Login())
                      //         // );
                      //       },
                      //       child: Text(' Sign In',
                      //         style: GoogleFonts.lato(fontSize: 16.sp,color: Colors.black),),
                      //     ),
                      //   ],
                      // ),
                    ],
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
