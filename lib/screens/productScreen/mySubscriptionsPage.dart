import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySubscriptions extends StatefulWidget {
  const MySubscriptions({Key? key}) : super(key: key);

  @override
  _MySubscriptionsState createState() => _MySubscriptionsState();
}

class _MySubscriptionsState extends State<MySubscriptions> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/empty.png',
      width: 0.7.sw,
      height: 0.75.sw,
    ));
  }
}
