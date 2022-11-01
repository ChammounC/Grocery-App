class AddToCartModel {
  int? statusCode;
  String? message;

  AddToCartModel({this.statusCode, this.message});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status code'] = this.statusCode;
    data['Message'] = this.message;
    return data;
  }
}