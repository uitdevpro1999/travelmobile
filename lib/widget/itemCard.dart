import 'package:flutter/material.dart';

import '../page/Detail.dart';
class ItemCard extends StatelessWidget{
  int? id;
  String? name;
  String? imagelink;
  int? price;
  ItemCard({Key? key, required this.id, required this.name, required this.imagelink , required this.price});
  @override
  Widget build(BuildContext context){
    return Card(
        child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
           onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Detail(uid: id)));
    },
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  imagelink!,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 08.0),
                child: Text(
                  name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,

                      fontSize: 14.0),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 05.0, bottom: 02.0),
                child: Text(
                  price.toString()+"đ",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

}