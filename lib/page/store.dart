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

class StorePage extends StatefulWidget {
  int storeId;
  String storeName;
  StorePage({Key? key, required this.storeId, required this.storeName}) : super (key:key);
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

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
        title: Text(widget.storeName, style: TextStyle(color: Colors.white)),
      ),
      body: Container(

        child: Stack(
          children: [

            Container(child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    future: fetchProductStore(widget.storeId),
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