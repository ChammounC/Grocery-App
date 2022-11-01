import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:theharmony/constants/urls.dart';

import '../../models/getAllProductModel.dart';
import '../../provider/providers/cartItemCount.dart';

class MinusButton extends StatefulWidget {
  final AllProductData itemList;
  int index;
  MinusButton({required this.index, required this.itemList, Key? key})
      : super(key: key);

  @override
  _MinusButtonState createState() => _MinusButtonState();
}

class _MinusButtonState extends State<MinusButton> {
  @override
  Widget build(BuildContext context) {
  int? quantity = Provider.of<CartItem>(context).itemCount[widget.itemList.id];
    return GestureDetector(
      onTap: () async {
        Provider.of<CartItem>(context, listen: false).decrement(widget.itemList.id);
        print('quantity:');
        print(quantity);
        if(quantity!=null) {
          if (quantity > 1) {
            // Decrease quantity of Cart Item by 1
            try {
              var params = json.encode(
                {
                  "cart_id": userCartId,
                  "user_id": mainUserId,
                  "product_id": widget.itemList.id,
                },
              );
              var headers = {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json'
              };
              var response = await http.put(Uri.parse(decreaseFromCart),
                  body: params, headers: headers);
              if (response.statusCode == 200) {
                var json = jsonDecode(response.body);
                if (json["status code"].toString() == '200') {
                  print('success');
                }
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Something went wrong!!")));
            }
          }
          else {
            try {
              var params = json.encode(
                {
                  "cart_id": userCartId,
                  "user_id": mainUserId,
                  "product_id": widget.itemList.id,
                  "item_quantity": 1,
                },
              );
              var headers = {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json'
              };
              var response = await http.delete(Uri.parse(removeFromCart),
                  body: params, headers: headers);
              if (response.statusCode == 200) {
                var json = jsonDecode(response.body);
                if (json["status code"].toString() == '200') {
                  print('success');
                }
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Something went wrong!!")));
            }
          }
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
        child: const Center(
          child: Icon(Icons.remove, color: AppColors.PRIMARY_COLOR, size: 14),
        ),
      ),
    );
  }
}
