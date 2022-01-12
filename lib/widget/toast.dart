import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProjectToast {
  final String msg;
  const ProjectToast({required this.msg});

   void pshowToast() {
     Fluttertoast.showToast(
      msg: 'Thông báo: $msg',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}