import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/provider/providers/cartItemCount.dart';

class PlusButton extends StatefulWidget {
  int index;
   PlusButton({required this.index,Key? key}) : super(key: key);

  @override
  _PlusButtonState createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
        Provider.of<CartItem>(context,listen: false).increment(widget.index),
      child: Container(
        height: 0.05.sw,
        width: 0.05.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.PRIMARY_COLOR,
            )),
        child:const Center(
          child: Icon(Icons.add,color: AppColors.PRIMARY_COLOR,size: 14,)
        ),
      ),
    );
  }
}
