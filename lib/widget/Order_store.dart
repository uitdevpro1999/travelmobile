import 'package:flutter/material.dart';
import 'package:travelmobile/model/order/orderproductdetail.dart';
import 'package:travelmobile/model/store.dart';

import '../page/orderproduct.dart';


class OrderStoreSum extends StatelessWidget {
  int totalPrice;
  int id;
  int orderId;
  String status;
  int storeId;
  List<OrderProductDetail> orderproduct;
  OrderStoreSum({Key? key,required this.storeId,required this.id,required this.status, required this.totalPrice,required this.orderId,required this.orderproduct}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
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
              FutureBuilder<Store>(
                future: fetchStore(storeId),
                builder:  (context, snapshot) {
                  if (snapshot.hasData) {
                    Store? data1 = snapshot.data;
                    return  Text(
                      data1!.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF0057BE),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },),

              const SizedBox(height: 4),
              Text(
                "ID ????n h??ng t??? c???a h??ng: "+ id.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "ID ????n h??ng: "+ orderId.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Th??nh ti???n: "+totalPrice.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Tr???ng th??i: " + status,
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
                   MaterialPageRoute(builder: (context) =>OrderProduct(orderproduct: orderproduct)));
             }, icon: Icon(Icons.navigate_next)),

           ],
         )
        ],
      ),
    );
  }
}
