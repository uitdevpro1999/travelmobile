import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

import 'orderproductdetail.dart';

part 'orderstoredetail.g.dart';

@JsonSerializable()
class OrderStoreDetail {
  int id;
  int orderId;
  int storeId;
  int totalPrice;
  String status;
  // alll othervarialble...
  List<OrderProductDetail>? orderProductDetailEntities;

  //initilize all in constructor
  OrderStoreDetail({required this.id,required this.orderId,required this.status, required this.storeId, required this.totalPrice ,required this.orderProductDetailEntities });
  @override
  factory OrderStoreDetail.fromJson(Map<String, dynamic> json) => _$OrderStoreDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStoreDetailToJson(this);
}
Future<List<OrderStoreDetail>> getOrderStore(int id) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  var url = Uri.http('api.travelmart.store','/api/v1/orders/store/$id');
  final response = await http.get(url,
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
  if(response.statusCode ==200){
    Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
    List<dynamic> orders = jsonResponse['data'];
    return orders.map((orderstoredetail) =>  OrderStoreDetail.fromJson(orderstoredetail)).toList();
  }
  else{
    throw Exception('fail to load Account Info from API');
  }
}