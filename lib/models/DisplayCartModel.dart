// To parse this JSON data, do
//
//     final displayCartModel = displayCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DisplayCartModel displayCartModelFromJson(String str) => DisplayCartModel.fromJson(json.decode(str));

String displayCartModelToJson(DisplayCartModel data) => json.encode(data.toJson());

class DisplayCartModel {
  DisplayCartModel({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  List<DisplayCartData> data;

  factory DisplayCartModel.fromJson(Map<String, dynamic> json) => DisplayCartModel(
    statusCode: json["status code"],
    data: List<DisplayCartData>.from(json["data"].map((x) => DisplayCartData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DisplayCartData {
  DisplayCartData({
    required this.id,
    required this.userId,
    required this.productId,
    required this.name,
    required this.image,
    required this.weight,
    required this.itemPrice,
    required this.itemQuantity,
    required this.discount,
  });

  int id;
  int userId;
  int productId;
  String name;
  String image;
  String weight;
  int itemPrice;
  int itemQuantity;
  String discount;

  factory DisplayCartData.fromJson(Map<String, dynamic> json) => DisplayCartData(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    name: json["name"],
    image: json["image"],
    weight: json["weight"],
    itemPrice: json["item_price"],
    itemQuantity: json["item_quantity"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "name": name,
    "image": image,
    "weight": weight,
    "item_price": itemPrice,
    "item_quantity": itemQuantity,
    "discount": discount,
};
}
