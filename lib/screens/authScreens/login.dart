import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/screens/authScreens/forgotpassword.dart';
import 'package:theharmony/screens/authScreens/recieveotp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  List<String> LoginImageList = [
    'assets/images/nut01.png',
    'assets/images/dairy01.png',
    'assets/images/nut02.png',
    'assets/images/fruit01.png',
  ];

  bool _isLoading = false;

  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
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
                          // SizedBox(
                          //   height: 0.55.sh,
                          //   width: 0.9.sw,
                          //   child: Image.asset('assets/images/nut01.png'),
                          // )
                          SizedBox(
                            width: 0.95.sw,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 0.55.sh,
                                viewportFraction: 1,
                                autoPlay: true,
                              ),
                              items: LoginImageList
                                  .map(
                                    (item) => Center(
                                  child: Image.asset(item,fit: BoxFit.fitHeight,),
                                ),
                              )
                                  .toList(),
                            ),
                          ),
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
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextField(
                                controller: numberController,
                                autofocus: false,
                                keyboardType: TextInputType.number,
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
                              onTap: () async {
                                // Navigator.of(context).push(
                                //     CupertinoPageRoute(builder: (context)=> RecieveOtp())
                                // );
                                if(numberController.text.isNotEmpty){
                                  await _loginCustomer(numberController.text.toString().trim());
                                }
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
                                    _isLoading
                                    ?Center(child: CircularProgressIndicator(),)
                                    :Text('Continue',
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
      ),
    );
  }


  _loginCustomer(number) async {
    try {
      print('inside login api');
      setState(() {
        _isLoading = true;
      });
      var params = json.encode(
        {
          "number": number
        },
      );
      var headers = {'Content-Type': 'application/json'};
      var response =
      await http.post(Uri.parse(loginUrl), body: params, headers: headers);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if(json["status code"].toString() == '200'){

          print('success otp sent.');



          print('data fetched');

          setState(() {
            _isLoading = false;
          });

          FocusScopeNode().unfocus();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RecieveOtp(userNumber: number,)
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
    }
  }
}
