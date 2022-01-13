import 'package:flutter/material.dart';


class OrderStoreSum extends StatelessWidget {
  int totalPrice;
  int id;
  String status;
  String name;

  OrderStoreSum({Key? key,required this.id,required this.status, required this.totalPrice,required this.name}) : super(key: key);


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
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0057BE),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "ID đơn hàng từ cửa hàng: "+ id.toString(),
                style: const TextStyle(
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
          IconButton(onPressed: (){

          }, icon: Icon(Icons.navigate_next))
        ],
      ),
    );
  }
}
