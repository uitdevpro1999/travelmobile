import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
              "Nhanh",
              "Tiêu chuẩn",
            ],
            onChange: (String label, int index) => print("label: $label index: $index"),
            onSelected: (String label) => print(label),
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
            onSelected: (String label) => print(label),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),

            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Xác nhận"))),
              onPressed: () => print("it's pressed"),
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

}