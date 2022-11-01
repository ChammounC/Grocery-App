// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

class AllProductModel {
  AllProductModel({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  List<AllProductData> data;

  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
    statusCode: json["status code"],
    data: List<AllProductData>.from(json["data"].map((x) => AllProductData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AllProductData {
  AllProductData({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.image,
    required this.subcategoryId,
    required this.categoryId,
  });

  int id;
  String name;
  String description;
  int amount;
  String image;
  int subcategoryId;
  int categoryId;

  factory AllProductData.fromJson(Map<String, dynamic> json) => AllProductData(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    amount: json["amount"],
    image: json["image"],
    subcategoryId: json["subcategory_id"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "amount": amount,
    "image": image,
    "subcategory_id": subcategoryId,
    "category_id": categoryId,
  };
}
