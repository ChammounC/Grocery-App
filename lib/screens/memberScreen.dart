import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MemberScreen extends StatelessWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('member body',style: TextStyle(fontSize: 24.sp),)),
    );
  }
}
