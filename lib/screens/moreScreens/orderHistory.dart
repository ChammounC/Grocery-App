import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/models/getMyOrdersModel.dart';
import 'package:theharmony/models/otherModels.dart';
import 'package:theharmony/screens/moreScreens/orderHistoryDetail.dart';
import 'package:http/http.dart' as http;

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {

  // List<OrderHistoryDetail> orderHistoryList = [
  //   OrderHistoryDetail(
  //       name: 'Cashew',
  //       deliveredOn: '2nd October',
  //       isDelivered: true,
  //       deliveryOn: '',
  //       imgsrc: 'assets/images/product1.png'
  //   ),
  //   OrderHistoryDetail(
  //       name: 'Special',
  //       deliveredOn: '20th October',
  //       isDelivered: true,
  //       deliveryOn: '',
  //       imgsrc: 'assets/images/nut01.png'
  //   ),
  // ];

  List<GetMyOrderData> myOrdersList = [];

  bool _hasOrders = true;

  @override
  void initState() {
    // TODO: implement initState
    _orderHistoryApi(mainUserId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7eee6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey,size: 30.r,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text('My Orders',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
              color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: myOrdersList.isEmpty
        ?_hasOrders
        ?Center(child: CircularProgressIndicator(),)
        :Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning,size: 40.r,color: Colors.brown,),
            Text('No Orders',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,
                  color: Colors.black),),
          ],
        ),)
        :Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemCount: myOrdersList.length,
                itemBuilder: (context,index) {
                  return OrderCard(myOrdersList[index]);
                },
              separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h,);
              },
            )
          ],
        ),
      ),
    );
  }

  OrderCard(GetMyOrderData orderDetail){
   return PhysicalModel(
      color: Colors.transparent,
      elevation: 5,
      shadowColor: Colors.black,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => OrderHistoryDetailPage(myOrderDetail: orderDetail,))
          );
        },
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(10.r),
                child: SizedBox(
                  height: 80.w,
                  width: 80.w,
                  child: Image.asset('assets/images/product1.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivered on ${orderDetail.deliveryDate}',
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp,
                        color: Colors.black),),
                  Text(orderDetail.id.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,
                        color: Colors.grey),),
                  //SizedBox(height: 5.h,),

                ],
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }

  _orderHistoryApi( int userId) async {
    try {
      print('inside my orders api');
      setState(() {
        _hasOrders = true;
      });
      print('1.1');
      // var params =
      //   {
      //     "user_id": userId
      //   };
      // var headers = {
      //   'Authorization': 'Bearer $token',
      //   'Content-Type': 'application/json'
      // };
      // print('1.2');
      // //final uri = Uri.parse(displayCartUrl);
      // final newUri = Uri.http(displayCartUrl, '/path', params);
      // print('1.3');
      // //final newUri = uri.replace(queryParameters: params);
      // print('1.4');
      // var response =
      // await http.get(newUri, headers: headers);

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var request = http.MultipartRequest('GET', Uri.parse(myOrderUrl));
      request.fields.addAll({
        'userId': userId.toString()
      });


      http.StreamedResponse response1 = await request.send();
      print('1.5');
      // if (kDebugMode) {
      //   print(response1.stream.bytesToString());
      // }
      print('1.6');
      var response = await response1.stream.bytesToString();

      if (response1.statusCode == 200) {
        var json = jsonDecode(response);
        if(json["status code"].toString() == '200'){

          print('success.');

          var data = GetMyOrderModel.fromJson(json);

          myOrdersList = data.data;

          print('data fetched');

          setState(() {
            _hasOrders = false;
            //_loaded = true;
          });

          FocusScopeNode().unfocus();
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            _hasOrders = false;
            //_loaded = true;
            //_isLoading = false;
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          _hasOrders = false;
          //_loaded = true;
          //_isLoading = false;
        });
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        //_loaded = true;
        //_isLoading = false;
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
    }
  }
}
