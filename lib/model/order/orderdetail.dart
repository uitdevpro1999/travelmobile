import 'package:json_annotation/json_annotation.dart';

import 'orderstoredetail.dart';

part 'orderdetail.g.dart'; ///you have to use naming convention of like this (yourfilename.g.dart)

@JsonSerializable()
class OrderDetail {
  int userId;
  int totalPrice;
  String receiverName;
  String email;
  String phone;
  String houseNumberStreet;
  String address;
  String shipmentMethod;
  String paymentMethod;
  // alll othervarialble...
  List<OrderStoreDetail>? orderStoreDetails;
  //initilize all in constructor
  OrderDetail({ required this.userId,required this.totalPrice,required this.receiverName,required this.email,required this.phone,required this.houseNumberStreet,required this.address,required this.paymentMethod,required this.shipmentMethod ,required this.orderStoreDetails });
  @override
  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
