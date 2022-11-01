import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/provider/providers/cartItemCount.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../models/getAllProductModel.dart';

class PlusButton extends StatefulWidget {
  final AllProductData itemList;
  int index;
   PlusButton({required this.index,required this.itemList,Key? key}) : super(key: key);

  @override
  _PlusButtonState createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Provider.of<CartItem>(context, listen: false).increment(widget.itemList.id);
        try {
          var params = json.encode(
            {
              "user_id": mainUserId,
              "product_id": widget.itemList.id,
              "item_price": widget.itemList.amount,
              "item_quantity": 1,
              "discount": "20%"
            },
          );
          var headers = {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          };
          var response =
          await http.post(
              Uri.parse(addToCartUrl), body: params, headers: headers);
          if (response.statusCode == 200) {
            var json = jsonDecode(response.body);
            if (json["status code"].toString() == '200') {
              var json = jsonDecode(response.body);
              userCartId = json["cart_id"][0]["id"];
            }
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong!!")));
        }
      },
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
