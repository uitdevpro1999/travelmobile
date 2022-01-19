import 'package:flutter/material.dart';
import 'package:travelmobile/model/order/orderproductdetail.dart';
import 'package:travelmobile/widget/Order_summary.dart';

import '../model/order/orderdetail.dart';
import '../model/order/orderstoredetail.dart';
import '../widget/Order_product.dart';
import '../widget/Order_store.dart';
class OrderProduct extends StatefulWidget{
  List<OrderProductDetail> orderproduct;
  OrderProduct({Key? key,required this.orderproduct}) : super (key: key);
  @override
  _OrderProductState createState() => _OrderProductState();
}
class _OrderProductState extends State<OrderProduct>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Theo dõi đơn hàng",),),
      body: SingleChildScrollView(
        child:ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.orderproduct.length,
            itemBuilder: (context, index) {
              return OrderProductSum(id: widget.orderproduct[index].id, price: widget.orderproduct[index].price, totalPrice: widget.orderproduct[index].totalPrice, productId: widget.orderproduct[index].productId, quantity: widget.orderproduct[index].quantity);
            }),

      ),
    );
  }
}