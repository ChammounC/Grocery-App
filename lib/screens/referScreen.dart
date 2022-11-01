import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/widgets/dottedLine.dart';

import '../constants/colors.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.07.sh,bottom:0.02.sh),
                width: 0.95.sw,
                height: 0.3.sh,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey.withOpacity(0.4))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/refer.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Refer a friend',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 0.02.sh),
              Text('And you can both save \u{20B9} 100 on your next order',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
              SizedBox(height: 0.02.sh),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.info, color: AppColors.PRIMARY_COLOR.withOpacity(0.8)),
                  SizedBox(width: 10),
                  Text('How it works',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.PRIMARY_COLOR.withOpacity(0.8))),
                ],
              ),
              SizedBox(height: 0.02.sh),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                child: Wrap(
                  children: [
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          height: 0.14.sw,
                          width: 0.14.sw,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(color: Colors.grey.withOpacity(0.7))
                          ),
                          child: Center(
                              child: Text('1',
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Color(0xFF6765ef),
                                      fontWeight: FontWeight.bold)))),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Invite your friends',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            'Just share your link',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF878787),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                height: 0.07.sw,
                width: 0.14.sw,
                child: Center(
                  child: Dash(
                    direction: Axis.vertical,
                    length: 25.sp,
                    dashGap: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                child: Wrap(
                  children: [
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          height: 0.14.sw,
                          width: 0.14.sw,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(color: Colors.grey.withOpacity(0.7))
                          ),
                          child: Center(
                              child: Text('2',
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Color(0xFF9f9ef7),
                                      fontWeight: FontWeight.bold)))),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'They download the app',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            'Using your referral',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF878787)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                height: 0.07.sw,
                width: 0.14.sw,
                child: Center(
                  child: Dash(
                    direction: Axis.vertical,
                    length: 25.sp,
                    dashGap: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                child: Wrap(
                  children: [
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          height: 0.14.sw,
                          width: 0.14.sw,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(color: Colors.grey.withOpacity(0.7))
                          ),
                          child: Center(
                              child: Text('3',
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Color(0xFF41c89b),
                                      fontWeight: FontWeight.bold)))),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Both get rewarded',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            'Get \u{20B9}100 off on next order',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF878787)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.05.sw, left: 0.02.sw),
                padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
                height: 0.05.sh,
                width: 0.9.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFF5c80bc).withOpacity(0.7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('http://dummyReferralCode/abcd123',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    Text('copy',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0.03.sw, left: 0.02.sw, bottom: 0.25.sw),
                padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
                height: 0.05.sh,
                width: 0.9.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppColors.PRIMARY_COLOR),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    SizedBox(width: 0.18.sw),
                    Text(
                      'Refer friends now',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
