import 'package:flutter/material.dart';
import 'package:travelmobile/model/product.dart';

import '../page/Detail.dart';
import '../page/orderproduct.dart';


class OrderProductSum extends StatelessWidget {
  int totalPrice;
  int id;
  int productId;
  int price;
   int quantity;
  OrderProductSum({Key? key,required this.id,required this.price, required this.totalPrice,required this.productId,required this.quantity}) : super(key: key);


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
              FutureBuilder<Product>(
                future: fetchdetailProduct(productId),
                builder:  (context, snapshot) {
                  if (snapshot.hasData) {
                    Product? data = snapshot.data;
                    return Text(
                      data!.name,
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
                },
              ),

              const SizedBox(height: 4),
              Text(
                "ID đơn hàng theo sản phẩm: "+ id.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "ID sản phẩm: "+ productId.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),

              const SizedBox(height: 4),
              Text(
                "Số lượng: " + quantity.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E3B52),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Giá: " + price.toString(),
                style: TextStyle(
                  fontSize: 14,
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
            ],

          ),

          const Spacer(),
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Detail(uid: productId)));
          }, icon: Icon(Icons.navigate_next))
        ],
      ),
    );
  }
}
