import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';

import '../../provider/providers/cartItemCount.dart';

class MinusButton extends StatefulWidget {
  int index;
   MinusButton({required this.index,Key? key}) : super(key: key);

  @override
  _MinusButtonState createState() => _MinusButtonState();
}

class _MinusButtonState extends State<MinusButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<CartItem>(context,listen: false).decrement(widget.index),
      child: Container(
        height: 0.05.sw,
        width: 0.05.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.PRIMARY_COLOR,
            )),
        child:const Center(
          child: Icon(Icons.remove,color: AppColors.PRIMARY_COLOR,size: 14),
        ),
      ),
    );
  }
}
