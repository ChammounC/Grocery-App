// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  List<GetProfileData> data;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    statusCode: json["status code"],
    data: List<GetProfileData>.from(json["data"].map((x) => GetProfileData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class GetProfileData {
  GetProfileData({
    required this.id,
    required this.userName,
    required this.email,
    required this.userType,
    required this.isdCode,
    required this.phone,
    required this.adress,
    required this.image,
    required this.dob,
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
    required this.member,
    required this.wallet,
    required this.referalCode,
    required this.longitude,
    required this.latitude,
    required this.membershipExpiry,
  });

  var id;
  var userName;
  var email;
  var userType;
  var isdCode;
  var phone;
  var adress;
  var image;
  var dob;
  var pincode;
  var city;
  var state;
  var country;
  var member;
  var wallet;
  var referalCode;
  var longitude;
  var latitude;
  var membershipExpiry;

  factory GetProfileData.fromJson(Map<String, dynamic> json) => GetProfileData(
    id: json["id"]==null?'':json["id"],
    userName: json["user_name"]==null?'':json["id"],
    email: json["email"]==null?'':json["email"],
    userType: json["user_type"]==null?'':json["user_type"],
    isdCode: json["isd_code"]==null?'':json["isd_code"],
    phone: json["phone"]==null?'':json["phone"],
    adress: json["adress"]==null?'':json["adress"],
    image: json["image"]==null?'':json["image"],
    dob: json["dob"]==null?'':json["dob"],
    pincode: json["pincode"]==null?'':json["pincode"],
    city: json["city"]==null?'':json["city"],
    state: json["state"]==null?'':json["state"],
    country: json["country"]==null?'':json["country"],
    member: json["member"]==null?'':json["member"],
    wallet: json["wallet"]==null?'':json["wallet"],
    referalCode: json["referal_code"]==null?'':json["referal_code"],
    longitude: json["longitude"]==null?'':json["longitude"],
    latitude: json["latitude"]==null?'':json["latitude"],
    membershipExpiry: json["membership_expiry"]==null?'':json["membership_expiry"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "email": email,
    "user_type": userType,
    "isd_code": isdCode,
    "phone": phone,
    "adress": adress,
    "image": image,
    "dob": dob.toIso8601String(),
    "pincode": pincode,
    "city": city,
    "state": state,
    "country": country,
    "member": member,
    "wallet": wallet,
    "referal_code": referalCode,
    "longitude": longitude,
    "latitude": latitude,
    "membership_expiry": membershipExpiry.toIso8601String(),
  };
}
