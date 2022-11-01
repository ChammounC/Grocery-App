// To parse this JSON data, do
//
//     final getSubCategoriesModel = getSubCategoriesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetSubCategoriesModel getSubCategoriesModelFromJson(String str) => GetSubCategoriesModel.fromJson(json.decode(str));

String getSubCategoriesModelToJson(GetSubCategoriesModel data) => json.encode(data.toJson());

class GetSubCategoriesModel {
  GetSubCategoriesModel({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  List<SubCategoryData> data;

  factory GetSubCategoriesModel.fromJson(Map<String, dynamic> json) => GetSubCategoriesModel(
    statusCode: json["status code"],
    data: List<SubCategoryData>.from(json["data"].map((x) => SubCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SubCategoryData {
  SubCategoryData({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.description,
  });

  int id;
  int categoryId;
  String name;
  String image;
  String description;

  factory SubCategoryData.fromJson(Map<String, dynamic> json) => SubCategoryData(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "image": image,
    "description": description,
  };
}
