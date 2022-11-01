
// To parse this JSON data, do
//
//     final loginOtpModel = loginOtpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SubmitModel SubmitModelFromJson(String str) => SubmitModel.fromJson(json.decode(str));

String SubmitModelToJson(SubmitModel data) => json.encode(data.toJson());

class SubmitModel {
  SubmitModel({
    required this.statusCode,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  var statusCode;
  var accessToken;
  var tokenType;
  SubmitData data;

  factory SubmitModel.fromJson(Map<String, dynamic> json) => SubmitModel(
    statusCode: json["status code"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    data: SubmitData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "access_token": accessToken,
    "token_type": tokenType,
    "data": data.toJson(),
  };
}

class SubmitData {
  SubmitData({
    required this.message,
    required this.mobileNumber,
    required this.otp,
  });

  var message;
  var mobileNumber;
  var otp;

  factory SubmitData.fromJson(Map<String, dynamic> json) => SubmitData(
    message: json["message"],
    mobileNumber: json["mobile number"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "mobile number": mobileNumber,
    "otp": otp,
  };
}

