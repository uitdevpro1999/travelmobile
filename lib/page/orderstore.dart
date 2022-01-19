import 'package:flutter/material.dart';

import '../model/order/orderstoredetail.dart';
import '../widget/Order_store.dart';
class OrderStore extends StatefulWidget{
  List<OrderStoreDetail> orderstore;
  OrderStore({Key? key,required this.orderstore}) : super (key: key);
  @override
  _OrderStoreState createState() => _OrderStoreState();
}
class _OrderStoreState extends State<OrderStore>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Theo dõi đơn hàng",),),
      body: SingleChildScrollView(
          child:ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.orderstore.length,
              itemBuilder: (context, index) {
                return OrderStoreSum(storeId:widget.orderstore[index].storeId ,id: widget.orderstore[index].id, status: widget.orderstore[index].status, totalPrice: widget.orderstore[index].totalPrice, orderId: widget.orderstore[index].orderId, orderproduct: widget.orderstore[index].orderProductDetails,);
              }),

      ),
    );
  }
}