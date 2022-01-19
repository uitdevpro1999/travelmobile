import 'package:flutter/material.dart';
import 'package:travelmobile/widget/Order_summary.dart';

import '../model/order/orderdetail.dart';
class Order extends StatefulWidget{
  Order({Key? key}) : super (key: key);
  @override
  _OrderState createState() => _OrderState();
}
class _OrderState extends State<Order>{
  @override
  ListView _orderListView(data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
            return OrderSummary(id: data[index].id, status: data[index].status, street: data[index].houseNumberStreet, phone: data[index].phone, totalPrice: data[index].totalPrice, address: data[index].address,name: data[index].receiverName,orderstore: data[index].orderStoreDetails);
          });

  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Theo dõi đơn hàng",),),
      body: SingleChildScrollView(
        child:
            FutureBuilder<List<OrderDetail>>(
              future: getOrder(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<OrderDetail>? data = snapshot.data;
                  return _orderListView(data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )
      ),
    );
  }
}