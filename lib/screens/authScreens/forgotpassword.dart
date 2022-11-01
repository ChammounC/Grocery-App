import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
        centerTitle: true,
        title: Text('Forgot Password',
          style: TextStyle(fontSize: 22.sp,color: Colors.black,
              fontWeight: FontWeight.w700),),
      ),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Enter your email and will send you instructions on "
                            "how to reset your password", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp,color: Colors.black,
                          fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ],
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Text('Email',
                      style: TextStyle(fontSize: 14.sp,color: Colors.black),),
                  ),
                ],
              ),
              Container(
                height: 52.h,
                width: 600.w,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r)
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
                            hintText: "johndeo@mail.com",
                            enabledBorder: InputBorder.none
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.01.sh,),
              SizedBox(height:0.03.sh,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PhysicalModel(
                    color: Colors.transparent,
                    shadowColor: Colors.blue,
                    elevation: 8.r,
                    child: Container(
                      width: 0.9.sw,
                      padding: EdgeInsets.symmetric(vertical: 12.r,horizontal: 10.r),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(2.r),
                          gradient:  LinearGradient(
                            colors: [
                              Colors.lightGreen,
                              Colors.lightGreen.withOpacity(0.8),
                            ],
                            begin: Alignment.centerLeft,
                            stops: [
                              0.6,
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
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
