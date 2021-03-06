import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travelmobile/widget/toast.dart';

import '../model/account/address.dart';
import '../widget/botnavigator.dart';
class Update extends StatefulWidget{
  String phone;
  String street;
  String add;
  String name;
  String mail;
  Update({Key? key, required this.add, required this.street,required this.phone,required this.name,required this.mail}) : super (key: key);
  @override
  _UpdateState createState() => _UpdateState();
}
class _UpdateState extends State<Update>{
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var streetController = TextEditingController();
  var addressController = TextEditingController();
  var mailController = TextEditingController();

  void set(){
    phoneController.text= widget.phone;
    streetController.text=widget.street;
    addressController.text=widget.add;
    nameController.text= widget.name;
    mailController.text= widget.mail;
  }
  @override
  void initState() {
    super.initState();
    set();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Cập nhật thông tin"),),
      body: SingleChildScrollView(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cập nhật thông tin",style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            TextFormField(
              controller: nameController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.person_rounded, color: Colors.black),
                hintText: "Họ và Tên",
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              controller: mailController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.black),
                hintText: "Email",
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              controller: phoneController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.phone, color: Colors.black),
                hintText: "Số điện thoại",
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              controller: streetController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.location_on, color: Colors.black),
                hintText: "Số nhà",
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              controller: addressController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.location_city, color: Colors.black),
                hintText: "Địa chỉ",
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  elevation: 0.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(18.0),
                ),
                onPressed: () {
                  update(phoneController.text, streetController.text, addressController.text,nameController.text,mailController.text);
                  var toast = new ProjectToast(msg: "Cập nhật đổi thành công");
                  toast.pshowToast();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BotNav()));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 70.0, top: 0.0, right: 70.0, bottom: 0.0),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(color: Colors.white),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}