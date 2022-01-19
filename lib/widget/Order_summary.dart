import 'package:flutter/material.dart';
import 'package:travelmobile/model/order/orderstoredetail.dart';
import 'package:travelmobile/page/orderstore.dart';

import '../model/order/orderdetail.dart';
import 'botnavigator.dart';



class OrderSummary extends StatelessWidget {
   String phone;
   String street;
   String address;
   int totalPrice;
   int id;
   String status;
   String name;
   List<OrderStoreDetail> orderstore;

  OrderSummary({Key? key,required this.id,required this.status,required this.street, required this.phone, required this.totalPrice, required this.address,required this.name,required this.orderstore}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      margin: const EdgeInsets.fromLTRB(2, 0, 2, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0057BE),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "ID đơn hàng: "+ id.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
               "Số điện thoại: "+ phone,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Số nhà, đường: "+ street,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Địa chỉ: "+address,softWrap: true,
                style: TextStyle(
                  fontSize: 11.7,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Thành tiền: "+totalPrice.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Trạng thái: " + status,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
            ],

          ),

          const Spacer(),
          Column(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OrderStore(orderstore: orderstore)));
                        }, icon: Icon(Icons.navigate_next)),
                        status =="CREATED" ? IconButton(onPressed: (){
                          cancelOrder(id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BotNav()));
                        }, icon: Icon(Icons.delete_forever)) :Container() ,
                      ],

          ),


        ],
      ),
    );
  }
}
