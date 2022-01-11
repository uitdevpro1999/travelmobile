import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:travelmobile/page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelmobile/widget/botnavigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travelmart",
      debugShowCheckedModeBanner: false,
      home: BotNav(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

