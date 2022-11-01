import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:theharmony/models/getProfileModel.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  List<GetProfileData> profileDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    print('main userId: $mainUserId');
    print('main token: $token');
    _getProfileApi(mainUserId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('My Profile',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
              color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: profileDataList.isEmpty
        ?Center(
          child: CircularProgressIndicator(color: Colors.brown,),
        )
        :SingleChildScrollView(
          child: Column(
            children: [
              PhysicalModel(
                color: Colors.transparent,
                elevation: 5,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.shade400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(maxRadius: 40.r,
                        child: profileDataList[0].image.toString().isEmpty
                              ?Image.asset('assets/images/user.png')
                              :Image.network(profileDataList[0].image),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.blue,
                        ),
                        child: Text('Update',
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                              color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h,),
              Row(
                children: [
                  Text('Name :',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].userName.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].userName.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('Email :',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].email.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].email.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('Country Code :',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].isdCode.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].isdCode.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('Phone :',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].phone.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].phone.toString().substring(2),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('Address :',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].adress.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].adress.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('DOB :',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].dob.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].dob.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('Pincode : ',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                        color: Colors.black),),
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.brown.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(profileDataList[0].pincode.toString().isEmpty
                        ?'NA'
                        :profileDataList[0].pincode.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,
                          color: Colors.black),),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  _getProfileApi(userId) async {
    try {
      print('inside get profile api');
      // setState(() {
      //   //_isLoading = true;
      // });
      // var params = json.encode(
      //   {
      //     "user_id": userId
      //   },
      // );
      // var headers = {
      //   'Authorization': 'Bearer $token',
      //   'Content-Type': 'application/json'
      // };
      // var response =
      // await http.post(Uri.parse(getProfileUrl), body: params, headers: headers);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var request = http.MultipartRequest('GET', Uri.parse(getProfileUrl));
      request.fields.addAll({
        'user_id': userId.toString()
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

          if (kDebugMode) {
            print('success.');
          }

          var data = GetProfileModel.fromJson(json);

          profileDataList = data.data;

          if (kDebugMode) {
            print('data fetched');
          }

          setState(() {
            //_isLoading = false;
          });

          FocusScopeNode().unfocus();
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            //_isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          //_isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(backgroundColor: Colors.red,content: Text("Server down, try again later!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        //_isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
    }
  }
}
