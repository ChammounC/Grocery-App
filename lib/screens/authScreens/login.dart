import 'package:theharmony/screens/authScreens/forgotpassword.dart';
import 'package:theharmony/screens/authScreens/recieveotp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        Text('Welcome',
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
                          child: Image.asset('assets/images/nut01.png'),
                        )
                      ],
                    ),
                    SizedBox(height: 0.01.sh,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.r),
                          child: Text('Enter you phone number',
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
                                  hintText: "Mobile Number",
                                  enabledBorder: InputBorder.none
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                  CupertinoPageRoute(builder: (context)=> RecieveOtp())
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
                                  Text('Continue',
                                    style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                                  //Icon(Icons.arrow_forward_ios,size: 20.r,),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 0.03.sh,),
                    SizedBox(
                      //width: mediaWidth(context, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.9.sw,
                            child: Divider(
                              height: 2.r,thickness: 1.r,color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Need help with log in?',
                          style: TextStyle(fontSize: 16.sp,color: Colors.black,
                              fontWeight: FontWeight.w300),),
                        GestureDetector(
                          onTap: (){
                            //Navigator.pop(context);
                            // Navigator.of(context).push(
                            //     CupertinoPageRoute(builder: (context) => Login())
                            // );
                          },
                          child: Text(' Click here',
                            style: TextStyle(fontSize: 16.sp,color: Colors.black),),
                        ),
                      ],
                    ),
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
