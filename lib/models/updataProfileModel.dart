// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  UpdateData data;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    statusCode: json["status code"],
    data: UpdateData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": data.toJson(),
  };
}

class UpdateData {
  UpdateData({
    required this.message,
    required this.id,
    required this.attribute,
    required this.updatedTo,
  });

  String message;
  String id;
  String attribute;
  String updatedTo;

  factory UpdateData.fromJson(Map<String, dynamic> json) => UpdateData(
    message: json["message"],
    id: json["id"],
    attribute: json["attribute"],
    updatedTo: json["updated to"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "id": id,
    "attribute": attribute,
    "updated to": updatedTo,
  };
}
