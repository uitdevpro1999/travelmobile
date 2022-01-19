import 'dart:convert';
import 'dart:io';
import'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelmobile/widget/toast.dart';
import 'orderstoredetail.dart';

part 'orderdetail.g.dart'; ///you have to use naming convention of like this (yourfilename.g.dart)

@JsonSerializable()
class OrderDetail {
  int id;
  int userId;
  int totalPrice;
  String receiverName;
  String email;
  String phone;
  String houseNumberStreet;
  String address;
  String shipmentMethod;
  String paymentMethod;
  String status;
  List<OrderStoreDetail> orderStoreDetails;
  //initilize all in constructor
  OrderDetail({ required this.userId,required this.totalPrice,required this.receiverName,required this.email,required this.phone,required this.houseNumberStreet,required this.address,required this.paymentMethod,required this.shipmentMethod,required this.id ,required this.orderStoreDetails,required this.status });
  @override
  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
Future<List<OrderDetail>> getOrder() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  var queryparams = {
    'limit': "15",
    'offset': "0",
  };
  var url = Uri.http('api.travelmart.store','/api/v1/orders/user/orders',queryparams);
  final response = await http.get(url,
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
  if(response.statusCode ==200){
    Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
    List<dynamic> orders = jsonResponse['data'];
    return orders.map((orderdetail) =>  OrderDetail.fromJson(orderdetail)).toList();
  }
  else{
    throw Exception('fail to load Account Info from API');
  }
}
 cancelOrder(int id) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  var url = Uri.http('api.travelmart.store','/api/account/order/$id/cancel');
  final response = await http.post(url,
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
  if(response.statusCode ==200){
   var a =new ProjectToast(msg: "Huỷ đơn hàng thành công");
   a.pshowToast();
  }
  else{
    throw Exception('fail to load Account Info from API');
  }
}
