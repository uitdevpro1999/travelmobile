import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'authorities.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  int? id;
  String? userName;
  String? email;
  int? storeId;
  String? avatar;
  bool? activated;
  // alll othervarialble...
  List<Authorities> authorities;

  //initilize all in constructor
  Account({ required this.id, required this.userName, required this.email, required this.storeId,required this.avatar, required this.activated ,required this.authorities });
  @override
  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
Future<Account> getAccount() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  final response = await http.get(Uri.parse("http://api.travelmart.store/api/account"),
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
  if(response.statusCode ==200){
    Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
    dynamic account = jsonResponse['data'];
    return Account.fromJson(account);
  }
  else{
    throw Exception('fail to load Account Info from API');
  }
}