// To parse this JSON data, do
//
//     final recieveOtpModel = recieveOtpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RecieveOtpModel recieveOtpModelFromJson(String str) => RecieveOtpModel.fromJson(json.decode(str));

String recieveOtpModelToJson(RecieveOtpModel data) => json.encode(data.toJson());

class RecieveOtpModel {
  RecieveOtpModel({
    required this.statusCode,
    required this.accessToken,
    required this.tokenType,
    required this.userId,
    required this.message,
  });

  int statusCode;
  String accessToken;
  String tokenType;
  List<UserId> userId;
  String message;

  factory RecieveOtpModel.fromJson(Map<String, dynamic> json) => RecieveOtpModel(
    statusCode: json["status code"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    userId: List<UserId>.from(json["user_id"].map((x) => UserId.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "access_token": accessToken,
    "token_type": tokenType,
    "user_id": List<dynamic>.from(userId.map((x) => x.toJson())),
    "message": message,
  };
}

class UserId {
  UserId({
    required this.id,
  });

  int id;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
