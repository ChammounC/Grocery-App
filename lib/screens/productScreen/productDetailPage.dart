import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';

import '../../provider/providers/cartItemCount.dart';
import '../../widgets/customButtons/minus.dart';
import '../../widgets/customButtons/plus.dart';
import '../../widgets/unorderedList.dart';
class ProductDetailPage extends StatefulWidget {
  final Map<String, String> itemDetails;
  final int index;
  const ProductDetailPage({required this.itemDetails,required this.index, Key? key})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.PRIMARY_COLOR,
              )),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(bottom:0.1.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.PRIMARY_COLOR.withOpacity(0.5),
                padding:
                    EdgeInsets.symmetric(vertical: 0.05.sh, horizontal: 0.1.sw),
                width: 1.sw,
                height: 0.6.sw,
                child: Image.asset(widget.itemDetails['imgUrl']!),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemDetails['productName']!,
                      style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      widget.itemDetails['weight']!,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 0.02.sh),
                    Text(
                      'Regular Price',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\u{20B9}${widget.itemDetails['price']}',
                      style:
                          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 0.02.sh),
                    Text(
                      'Member Price (30% off)',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\u{20B9}${(double.parse(widget.itemDetails['price']!) - (double.parse(widget.itemDetails['price']!) * 0.3)).ceil()} ',
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\u{20B9}${widget.itemDetails['price']} ',
                              style: TextStyle(
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 1.5,
                                decoration: TextDecoration.lineThrough,
                                  color: Colors.black45,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Provider.of<CartItem>(context).itemCount[widget.index] == 0
                            ? InkWell(
                          onTap: () => Provider.of<CartItem>(context,
                              listen: false)
                              .increment(widget.index),
                          child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: 0.2.sw,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12.0),
                                  color: AppColors.PRIMARY_COLOR),
                              child: Center(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp),
                                  ))),
                        )
                            :Container(
                          padding: EdgeInsets.all(6.0),
                          width: 0.2.sw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                  color: AppColors.PRIMARY_COLOR)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              MinusButton(index: widget.index),
                              SizedBox(
                                width: 0.05.sw,
                                child: Center(
                                  child: Text(
                                    '${Provider.of<CartItem>(context).itemCount[widget.index]}',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                              ),
                              PlusButton(index: widget.index),
                            ],
                          ),
                        ),
                      ],
                    ),
                        const Divider(
                          thickness: 1,
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex:10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select your plan type',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('One Time',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                                    SizedBox(width: 0.05.sw),
                                    GestureDetector(
                                      onTap: null,
                                      child: Icon(Icons.edit,color: AppColors.PRIMARY_COLOR,),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            flex:8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Start Date',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(DateFormat.yMMMd().format(DateTime.now()),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                                    SizedBox(width: 0.05.sw),
                                    GestureDetector(
                                      onTap: null,
                                      child: Icon(Icons.edit,color: AppColors.PRIMARY_COLOR,),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text('Description',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                    SizedBox(height: 0.01.sh),
                    UnorderedList(const [
                      "This Diwali, opt for a healthier way to show your love and care to close ones.",
                      "Bring them the freshest natural treat with theHarmony Dry Fruits,",
                      "All Dry fruits are 100% Natural, Premium and Chemical free that are delivered to you with minimal processing.",
                      "No artificial flavours or synthetic colours added.",
                      "We deliver the milk under the best cold chain right up to your doorstep."
                    ]),
                  ],
                ),
              ),
              Provider.of<CartItem>(context).cartEmpty?Container():Center(
                child: Container(
                    width:0.6.sw,
                    height: 0.05.sh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: AppColors.PRIMARY_COLOR.withOpacity(0.2),
                        border: Border.all(
                            color: AppColors.PRIMARY_COLOR
                        )
                    ),
                    child: Center(child: Text('Go to Cart',style: TextStyle(color: AppColors.PRIMARY_COLOR,fontSize: 16.sp,fontWeight: FontWeight.w500),))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
