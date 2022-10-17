import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/provider/providers/cartItemCount.dart';
import 'package:theharmony/screens/productScreen/productDetailPage.dart';
import 'package:theharmony/widgets/customButtons/minus.dart';

import '../../../constants/colors.dart';
import '../../../widgets/customButtons/plus.dart';

class ProductsListView extends StatefulWidget {
  final List<Map<String, String>> itemList;
  const ProductsListView({required this.itemList, Key? key}) : super(key: key);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    List<int> value = List.filled(widget.itemList.length, 0);
    return ListView.separated(
      itemCount: widget.itemList.length,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    ProductDetailPage(itemDetails:widget.itemList[index],index: index,))),
        child: Container(
          padding: EdgeInsets.all(12.0),
          height: 0.15.sh,
          width: 0.95.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border:
                  Border.all(color: AppColors.PRIMARY_COLOR.withOpacity(0.2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 2,
                  child: Image.asset(widget.itemList[index]['imgUrl']!)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: VerticalDivider(width: 2)),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.itemList[index]['productName']!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                      Text(widget.itemList[index]['weight']!,
                          style:
                              TextStyle(color: Colors.grey, fontSize: 12.sp)),
                      SizedBox(height: 0.015.sh),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\u{20B9} ${widget.itemList[index]['price']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Provider.of<CartItem>(context).itemCount[index] == 0
                              ? InkWell(
                                  onTap: () => Provider.of<CartItem>(context,
                                          listen: false)
                                      .increment(index),
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
                              : Container(
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
                                      MinusButton(index: index),
                                      SizedBox(
                                        width: 0.05.sw,
                                        child: Center(
                                          child: Text(
                                            '${Provider.of<CartItem>(context).itemCount[index]}',
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                      PlusButton(index: index),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
