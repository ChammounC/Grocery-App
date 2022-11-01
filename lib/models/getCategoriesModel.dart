// To parse this JSON data, do
//
//     final getCategoriesModel = getCategoriesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetCategoriesModel getCategoriesModelFromJson(String str) => GetCategoriesModel.fromJson(json.decode(str));

String getCategoriesModelToJson(GetCategoriesModel data) => json.encode(data.toJson());

class GetCategoriesModel {
  GetCategoriesModel({
    required this.statusCode,
    required this.data,
  });

  var statusCode;
  List<CategoryData> data;

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) => GetCategoriesModel(
    statusCode: json["status code"],
    data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryData {
  CategoryData({
    required this.id,
    required this.name,
    required this.image,
    required this.noOfProducts,
  });

  var id;
  var name;
  var image;
  var noOfProducts;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    noOfProducts: json["no_of_products"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "no_of_products":noOfProducts,
  };
}
