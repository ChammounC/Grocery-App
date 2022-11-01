import 'dart:convert';
import 'dart:ui';

import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/screens/authScreens/login.dart';
import 'package:theharmony/screens/miscScreens/mycart.dart';
import 'package:theharmony/screens/moreScreens/accountPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/screens/moreScreens/orderHistory.dart';
import 'package:http/http.dart' as http;

import 'moreScreens/accountPage.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  bool _success = false;
  bool _loggingOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Image.asset('assets/images/logo.png'),
                    )
                  ],
                ),
                SizedBox(height: 40.h,),
                Row(
                  children: [
                    Text('Available balance',
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
                Row(
                  children: [
                    Text('350.00',
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20.sp,
                          color: Colors.black),),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhysicalModel(
                      color: Colors.white,
                      shadowColor: Colors.blue,
                      elevation: 8.r,
                      child: GestureDetector(
                        onTap: (){
                          // Navigator.of(context).push(
                          //     CupertinoPageRoute(builder: (context)=> RecieveOtp())
                          // );
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
                              Text('Add money to wallet',
                                style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                              //Icon(Icons.arrow_forward_ios,size: 20.r,),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    Text('Rewards',
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w,),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.r),
                            child: SizedBox(
                                height: 30.h,
                                width: 30.h,
                                child: Image.asset('assets/icons/refer.png')),
                          ),
                          Text('Refer & Earn',
                            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,
                                color: Colors.black),)
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.r),
                            child: SizedBox(
                                height: 30.h,
                                width: 30.h,
                                child: Image.asset('assets/icons/offer.png')),
                          ),
                          Text('Offer Zone',
                            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,
                                color: Colors.black),)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xff8c551c).withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: MoreCard(
                            onTap: (){
                              Navigator.of(context).push(
                                  CupertinoPageRoute(builder: (context) => Account())
                              );
                            },
                            iconName: 'account',
                            title: 'Account & Preferences',
                            content: 'Edit Address, Delivery Preferences'
                        ),),
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: MoreCard(
                            onTap: (){
                              Navigator.of(context).push(
                                  CupertinoPageRoute(builder: (context) => OrderHistory())
                              );
                            },
                            iconName: 'order',
                            title: 'Order & Billing',
                            content: 'Order History, Transactions, Monthly Bill'
                        ),),
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: MoreCard(
                            onTap: (){
                              Navigator.of(context).push(
                                  CupertinoPageRoute(builder: (context) => MyCart())
                              );
                            },
                            iconName: 'cart',
                            title: 'My Cart',
                            content: 'cart items'
                        ),),
                      // Padding(
                      //   padding: EdgeInsets.all(5.r),
                      //   child: MoreCard(
                      //       iconName: 'payment',
                      //       title: 'Wallet & Payment Modes',
                      //       content: 'Add Money, Add or remove saved cards'
                      //   ),),
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: MoreCard(
                            iconName: 'help',
                            title: 'Need Help?',
                            content: 'Call or Chat with us'
                        ),),
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: MoreCard(
                            iconName: 'legal',
                            title: 'Legal',
                            content: 'Privacy, Terms & Conditions'
                        ),),
                      Padding(
                        padding: EdgeInsets.all(5.r),
                        child: MoreCard(
                            onTap: (){
                              print('logout pressed');
                              showDialogAlert();
                            },
                            iconName: 'logout',
                            title: 'Log Out',
                            content: 'Exit'
                        ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  MoreCard({
    required String iconName,
    required String title,
    required String content,
    Function()? onTap,
  }){
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: SizedBox(
                width: 30.w,
                child: Image.asset('assets/icons/$iconName.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(title,
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
                      child: Text(content,//overflow: TextOverflow.visible,
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                            color: Colors.black),),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Icon(Icons.arrow_forward_ios_outlined,size: 20.r,color: Colors.grey,),)
          ],
        ),
      ),
    );
  }

  _logoutApi(userId) async {
    try {
      print('inside logout api');
      setState(() {
        //_isLoading = true;
      });
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var request = http.MultipartRequest('PUT', Uri.parse(logoutUrl));
      request.fields.addAll({
        'id': userId.toString()
      });

      request.headers.addAll(headers);

      http.StreamedResponse response1 = await request.send();

      var response = await response1.stream.bytesToString();
      // if (kDebugMode) {
      //   print(response.body);
      // }
      if (response1.statusCode == 200) {
        var json = jsonDecode(response);
        if(json["status code"].toString() == '200'){

          print('success');



          print('logging out');

          setState(() {
            _success = true;
            //_loggingOut = false;
          });

          FocusScopeNode().unfocus();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Login()
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            _success = true;
            _loggingOut = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          _success = true;
          _loggingOut = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        _success = true;
        _loggingOut = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
    }
  }

  showDialogAlert(){
    return showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          title: _loggingOut ? Text('Please wait') :_success ? Text('Failed') :Text('Log Out'),
          content: _loggingOut ?Center(child: CircularProgressIndicator(),) : _success ? Text('Please try again later') :Text('Do you really want to Exit app?'),
          actions:_loggingOut
          ?[]
          :_success
          ?[ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('Ok'),
          ),]
          :[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _loggingOut = true;
                  //FocusScope.of(context).unfocus();
                });
                //Navigator.of(context).pop(true);
                FocusScope.of(context).unfocus();

                _logoutApi(mainUserId);
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
              child:Text('Yes'),
            ),

          ],
        ),
      ),
    );
  }
}

