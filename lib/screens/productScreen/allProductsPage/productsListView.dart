import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/models/getAllProductModel.dart';
import 'package:theharmony/provider/providers/cartItemCount.dart';
import 'package:theharmony/screens/customizePlanPage.dart';
import 'package:theharmony/screens/productScreen/productDetailPage.dart';
import 'package:theharmony/widgets/customButtons/minus.dart';
import 'package:http/http.dart' as http;

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/urls.dart';
import '../../../widgets/customButtons/plus.dart';

class ProductsListView extends StatefulWidget {
  final List<AllProductData> itemList;
  final bool? goToCustomize;
  const ProductsListView({required this.itemList, this.goToCustomize, Key? key})
      : super(key: key);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    List<int> value = List.filled(widget.itemList.length, 0);
    return
      ListView.separated(
      itemCount: widget.itemList.length,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () =>
        // widget.goToCustomize == true
        //     ? Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (_) => CustomizePlanPage(
        //                 details: widget.itemList[index], index: index)))
        //     :
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                          itemDetails: widget.itemList[index],
                          index: index,
                        ))),
        child: Container(
          padding: EdgeInsets.all(12.0),
          height: 0.2.sh,
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
                  child: Image.asset('assets/images/product2.png')),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: VerticalDivider(width: 2)),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,right: 8,left: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.itemList[index].name.toString()} : ${widget.itemList[index].id}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,)),
                      Text('200 gm',
                          style:
                              TextStyle(color: Colors.grey, fontSize: 12.sp)),
                      //SizedBox(height: 0.01.sh),
                      Row(
                        children: [
                          Text(
                            '₹${widget.itemList[index].amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ),
                          Text(
                            ' Our Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '₹${(widget.itemList[index].amount+(widget.itemList[index].amount * 0.2)).ceil().toInt()}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.black),
                              ),
                              Text(
                                ' MRP',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Provider.of<CartItem>(context).itemCount[widget.itemList[index].id] == 0 || Provider.of<CartItem>(context).itemCount[widget.itemList[index].id]==null
                              ? InkWell(
                                  onTap: () async {
                                    Provider.of<CartItem>(context,
                                        listen: false)
                                        .increment(widget.itemList[index].id);
                                    try {
                                      var params = json.encode(
                                        {
                                          "user_id": mainUserId,
                                          "product_id": widget.itemList[index]
                                              .id,
                                          "item_price": widget.itemList[index]
                                              .amount,
                                          "item_quantity": 1,
                                          "discount": "20%"
                                        },
                                      );
                                      var headers = {
                                        'Authorization': 'Bearer $token',
                                        'Content-Type': 'application/json'
                                      };
                                      var response = await http.post(
                                          Uri.parse(addToCartUrl), body: params,
                                          headers: headers);
                                          if (response.statusCode == 200) {
                                            var json = jsonDecode(response.body);
                                            userCartId = json["cart_id"][0]["id"];
                                            print('success');
    }
                                    }catch(e){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong!!")));
                                    }
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8.r),
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
                                      MinusButton(index: index,itemList: widget.itemList[index]),
                                      SizedBox(
                                        width: 0.05.sw,
                                        child: Center(
                                          child: Text(
                                            '${Provider.of<CartItem>(context).itemCount[widget.itemList[index].id]??'0'}',
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                      PlusButton(index: index,itemList: widget.itemList[index]),
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
