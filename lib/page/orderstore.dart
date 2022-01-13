import 'package:flutter/material.dart';
import 'package:travelmobile/widget/Order_summary.dart';

import '../model/order/orderdetail.dart';
import '../model/order/orderstoredetail.dart';
class OrderStore extends StatefulWidget{
  int id;
  OrderStore({Key? key,required this.id}) : super (key: key);
  @override
  _OrderStoreState createState() => _OrderStoreState();
}
class _OrderStoreState extends State<OrderStore>{
  @override
  ListView _orderListView(data) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return OrderSummary(id: data[index].id, status: data[index].status, street: data[index].houseNumberStreet, phone: data[index].phone, totalPrice: data[index].totalPrice, address: data[index].address,name: data[index].receiverName,);
        });

  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Theo dõi đơn hàng",),),
      body: SingleChildScrollView(
          child:
          FutureBuilder<List<OrderStoreDetail>>(
            future: getOrderStore(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<OrderStoreDetail>? data = snapshot.data;
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