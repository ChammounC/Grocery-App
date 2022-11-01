import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/colors.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColors.PRIMARY_COLOR
        )
      ),
      width: 0.18.sw,
      height:0.02.sh,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_balance_wallet,color: AppColors.PRIMARY_COLOR,),
          Text('\u{20B9} 0',style: TextStyle(color: AppColors.PRIMARY_COLOR),)
        ],
      ),
    );
  }
}
