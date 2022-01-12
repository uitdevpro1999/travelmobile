import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:travelmobile/page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelmobile/widget/imageslide.dart';
import 'package:travelmobile/widget/sidebar.dart';

import '../model/order/orderstoredetail.dart';
import '../model/product.dart';
import '../widget/itemCard.dart';
import 'Detail.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super (key:key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
      String? token = sharedPreferences.getString("token");
        final response = await http.get(Uri.parse("http://api.travelmart.store/api/account"),
            headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
        if(response.statusCode ==200){
          var jsonResponse = jsonDecode(response.body);
          print(jsonResponse);
          sharedPreferences.setInt("id", jsonResponse['data']['id']);
        }
      }

  @override
  GridView _ProductGridView(data){
    return GridView.builder(
      physics:  NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
             mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index)
              {
                print(data[index].id);
      return ItemCard(id: data[index].id, name: data[index].name, imagelink: data[index].imagelink, price: data[index].price);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Travelmart", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Container(

        child: Stack(
          children: [

            Container(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  SlideImages(),
                  Container(
                    margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo[600],
                          elevation: 0.0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 70.0, top: 0.0, right: 70.0, bottom: 0.0),
                          child: Text(
                            'Tất cả sản phẩm',
                            style: TextStyle(color: Colors.white),

                          ),
                        ),
                      ),
                    ),
                  ),
              FutureBuilder<List<Product>>(
                future: fetchProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product>? data = snapshot.data;
                    return _ProductGridView(data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              )
                ],

              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}