import 'dart:convert';
import 'package:http/http.dart' as http;
class Store{
  int id;
  String name;
  bool active;
  Store({required this.name,required this.id, required this.active});
  factory Store.fromJson(Map<String, dynamic>json){
    return Store(
        name: json['name'],
        id: json['id'],
        active: json['active'],
    );
  }
}
Future<Store> fetchStore(int? id) async{
  var url = 'http://api.travelmart.store/api/v1/stores/$id';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode==200)
  {
    Map<String,dynamic> jsonResponse = jsonDecode((utf8.decode(response.bodyBytes)));
    dynamic store = jsonResponse['data'];
    return Store.fromJson(store);
  }
  else{
    throw Exception('fail to load Store from API');
  }
}