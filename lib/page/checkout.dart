import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:travelmobile/model/order/orderdetail.dart';
import 'package:travelmobile/model/order/orderproductdetail.dart';
import 'package:travelmobile/model/order/orderstoredetail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelmobile/widget/botnavigator.dart';
import 'package:travelmobile/widget/toast.dart';

class Checkout extends StatefulWidget {
  int storeId;
  int productId;
  int quantity;
  int price;
  int totalPrice;
  Checkout({Key?key, required this.storeId, required this.productId, required this.price, required this.totalPrice, required this.quantity});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
 var namecontrol = TextEditingController();
 var mailcontrol = TextEditingController();
 var phonecontrol = TextEditingController();
 var streetcontrol = TextEditingController();
 var addresscontrol = TextEditingController();
 var ship;
 var pay;
 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Thanh toán"),
      ),
      body: _body(),
    );
    //
  }

  Widget _body(){
    return ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 14.0, top: 14.0),
            child: Text("Thông tin thanh toán",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: namecontrol,
            decoration: InputDecoration(
              hintText: 'Họ và tên',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: mailcontrol,
            decoration: InputDecoration(
              hintText: 'Email',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: phonecontrol,
            decoration: InputDecoration(
              hintText: 'Số điện thoại',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: streetcontrol,
            decoration: InputDecoration(
              hintText: 'Số nhà',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: addresscontrol,
            decoration: InputDecoration(
              hintText: 'Địa chỉ',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 14.0, top: 14.0),
            child: Text("Phương thức vận chuyển",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
          ),

          RadioButtonGroup(
            labels: [
              "Nhận tại cửa hàng",
              "Dịch vụ giao hàng",
            ],
            onChange: (String label, int index) => print("label: $label index: $index"),
            onSelected: (String label) => ship=label,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14.0, top: 14.0),
            child: Text("Phương thức thanh toán",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
          ),
          RadioButtonGroup(
            labels: [
              "Thanh toán khi nhận hàng",
              "Thanh toán qua ví ZaloPay",
              "Thanh toán qua ví Momo"
            ],
            onChange: (String label, int index) => print("label: $label index: $index"),
            onSelected: (String label) => pay=label,
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),

            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Xác nhận"))),
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ]
    );
  }
void submit() async {
   if(mailcontrol.text== ""||phonecontrol==""||addresscontrol.text==""||streetcontrol.text==""){
     var toast = new ProjectToast(msg: "vui lòng nhập đầy đủ thông tin");
     toast.pshowToast();
   }
   else{

     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String? token = sharedPreferences.getString("token");
     int? userId = sharedPreferences.getInt("id");
     var jsonResponse;
     if(pay=="Thanh toán khi nhận hàng")
     {
       pay="COD";
     }
     else if(pay=="Thanh toán qua ví ZaloPay"){
       pay="ZALOPAY";
     }
     else if(pay=="Thanh toán qua ví Momo")
     {
       pay='MOMO';
     }
     if(ship=="Nhận tại cửa hàng")
       {
         ship ="RECEIVE_AT_STORE";
       }
     else{
       ship="SHIPPING";
     }
     print(ship);
     print(pay);
     var response = await http.post(
         Uri.parse('http://api.travelmart.store/api/v1/orders/create'),
         headers: {
           HttpHeaders.contentTypeHeader: "application/json",
           HttpHeaders.authorizationHeader: "Bearer $token"
         },
         body: jsonEncode(<String,dynamic>{
           'userId': userId,
           'totalPrice': widget.totalPrice,
           'receiverName': namecontrol.text,
           'email': mailcontrol.text,
           'phone': phonecontrol.text,
           'houseNumberStreet': streetcontrol.text,
           'address': addresscontrol.text,
           'shipmentMethod': ship,
           'paymentMethod': pay,
           'orderStoreDetails': [{
             'storeId': widget.storeId,
             'totalPrice': widget.totalPrice,
             'orderProductDetails': [{
               'productId': widget.productId,
               'quantity' : widget.quantity,
               'price': widget.price,
               'totalPrice': widget.totalPrice,
             }],
           },
           ],
         }));
     print(response.body);
     if (response.statusCode == 200) {
       jsonResponse = jsonDecode(response.body);
       if (jsonResponse != null && (jsonResponse['error']['code']==1)) {
         var ahha = jsonResponse['data']['orderId'];
         var toast = new ProjectToast(msg: "Thanh toán thành công, mã đơn hàng là $ahha");
         toast.pshowToast();
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => BotNav()),
         );
       }
       else {
         var toast = new ProjectToast(msg: "Thanh toán thất bại");
         toast.pshowToast();
       }
     }
   }
   }

}