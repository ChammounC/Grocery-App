// To parse this JSON data, do
//
//     final getMyOrderModel = getMyOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMyOrderModel getMyOrderModelFromJson(String str) => GetMyOrderModel.fromJson(json.decode(str));

String getMyOrderModelToJson(GetMyOrderModel data) => json.encode(data.toJson());

class GetMyOrderModel {
  GetMyOrderModel({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  List<GetMyOrderData> data;

  factory GetMyOrderModel.fromJson(Map<String, dynamic> json) => GetMyOrderModel(
    statusCode: json["status code"],
    data: List<GetMyOrderData>.from(json["data"].map((x) => GetMyOrderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class GetMyOrderData {
  GetMyOrderData({
    required this.id,
    required this.userId,
    required this.transactionId,
    required this.transactionType,
    required this.amount,
    required this.totalItems,
    required this.discount,
    required this.deliveryDate,
    required this.deliveryAddress,
    required this.city,
    required this.orderType,
    required this.subscriptionId,
    required this.pincode,
  });

  var id;
  var userId;
  var transactionId;
  var transactionType;
  var amount;
  var totalItems;
  var discount;
  var deliveryDate;
  var deliveryAddress;
  var city;
  var orderType;
  var subscriptionId;
  var pincode;

  factory GetMyOrderData.fromJson(Map<String, dynamic> json) => GetMyOrderData(
    id: json["id"],
    userId: json["user_id"],
    transactionId: json["transaction_id"],
    transactionType: json["transaction_type"],
    amount: json["amount"],
    totalItems: json["total_items"],
    discount: json["discount"],
    deliveryDate: json["delivery_date"],
    deliveryAddress: json["delivery_address"],
    city: json["city"],
    orderType: json["order_type"],
    subscriptionId: json["subscription_id"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "transaction_id": transactionId,
    "transaction_type": transactionType,
    "amount": amount,
    "total_items": totalItems,
    "discount": discount,
    "delivery_date": deliveryDate,
    "delivery_address": deliveryAddress,
    "city": city,
    "order_type": orderType,
    "subscription_id": subscriptionId,
    "pincode": pincode,
  };
}
