import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelmobile/widget/toast.dart';
class Address{
  int? id;
  String? username;
  String? houseNumberStreet;
  String? address;
  String? phone;
  String? name;
  String? email;
  Address({required this.id, required this.username, required this.houseNumberStreet, required this.address, required this.phone, required this.name, required this.email});
  factory Address.fromJson(Map<String,dynamic> json){
      return Address(
          id: json['id'],
          username: json['username'],
          houseNumberStreet: json['houseNumberStreet'],
          address: json['address'],
          phone: json['phone'],
          name: json['name'],
        email: json['email'],
      );
  }
}
Future<Address> getAddress() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  final response = await http.get(Uri.parse("http://api.travelmart.store/api/account/address"),
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
  if(response.statusCode ==200){
    Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
    dynamic address = jsonResponse['data'];
    return Address.fromJson(address);
  }
  else{
    throw Exception('fail to load Address Info from API');
  }
}
update(String phone,String street, String address,String name,String mail) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  var jsonResponse;
  var response = await http.post(
      Uri.parse('http://api.travelmart.store/api/account/address'),
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"},
      body: jsonEncode(<String, String>{
        'phone': phone,
        'houseNumberStreet': street,
        'address': address,
        'name': name,
        'email':mail,
      }));
  if (response.statusCode == 200) {
    jsonResponse = jsonDecode(response.body);
    if (jsonResponse != null) {
      var toast = new ProjectToast(msg: "Cập nhật thành công");
      toast.pshowToast();
    }
  else {
    var toast = new ProjectToast(msg: "Cập nhật thất bại");
    toast.pshowToast();
  }
}
}
