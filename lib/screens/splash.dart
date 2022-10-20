
import 'package:theharmony/screens/authScreens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Image.asset('assets/images/splashback.jpg').color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              //width: 250,
              decoration: BoxDecoration(
                color: Colors.transparent,
                //borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                //borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/logo.png',
                  //width: 250,
                  //height: 250,
                ),
              ),
            ),

             SizedBox(
              height: 0.1.sw,
            ),
            Text(
              "Goodness with amazing taste",
              style: TextStyle(fontSize: 24.sp,color: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
}