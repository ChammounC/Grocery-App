// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.statusCode,
    required this.data,
  });

  var statusCode;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    statusCode: json["status code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.message,
    required this.mobileNumber,
  });

  var message;
  var mobileNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    mobileNumber: json["mobile number"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "mobile number": mobileNumber,
  };
}
