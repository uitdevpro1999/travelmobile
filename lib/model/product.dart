import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Product{
  int id;
  String name;
  int? storeId;
  String description;
  int price;
  int stock;
  int sold;
  String createdAt;
  String imagelink;
  bool activated;
  String productType;
  String productLocation;
  Product({
    required this.id,
    required this.name,
    required this.storeId,
    required this.description,
    required this.price,
    required this.stock,
    required this.sold,
    required this.createdAt,
    required this.imagelink,
    required this.activated,
    required this.productType,
    required this.productLocation,
  });
  factory Product.fromJson(Map<String,dynamic> json)
  {
    return Product(
      id: json["id"],
      name: json["name"],
      storeId: json["storeId"],
      description: json["description"],
      price: json["price"],
      stock: json["stock"],
      sold: json["sold"],
      createdAt: json["createdAt"],
      imagelink: json["images"],
      activated: json["activated"],
      productType: json["productType"],
      productLocation: json["productLocation"],
    );
  }
}
Future<List<Product>> fetchProduct() async{
  var queryparams = {
    'limit': "1000",
    'offset': "0",
    'orderBy': 'name',
  };
  var url = Uri.http('api.travelmart.store','/api/v1/products/paging',queryparams);
  var response = await http.get(url);
  if(response.statusCode == 200)
    {
      Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
      List<dynamic> products = jsonResponse['data'];
      return products.map((product) =>  Product.fromJson(product)).toList();

    }
  else{
    throw Exception('fail to load Product from API');
  }
}
Future<List<Product>> fetchProductStore(int id) async{

  var url = Uri.http('api.travelmart.store','/api/v1/products/store/$id/products',);
  var response = await http.get(url);
  if(response.statusCode == 200)
  {
    Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
    List<dynamic> products = jsonResponse['data'];
    return products.map((product) =>  Product.fromJson(product)).toList();

  }
  else{
    throw Exception('fail to load Product from API');
  }
}
Future<Product> fetchdetailProduct(int? id) async{
  var url = 'http://api.travelmart.store/api/v1/products/$id';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode==200)
    {
      Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
      dynamic product = jsonResponse['data'];
       return Product.fromJson(product);
    }
  else{
    throw Exception('fail to load Detail Product from API');
  }
}