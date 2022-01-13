import 'package:flutter/material.dart';
import 'package:travelmobile/model/order/orderdetail.dart';

import '../page/explorer.dart';
import '../page/homepage.dart';
import '../page/orderfollowing.dart';
import '../page/profilepage.dart';
class BotNav extends StatefulWidget {
  const BotNav({Key? key}) : super(key: key);

  @override
  State<BotNav> createState() => _BotNavState();
}
class _BotNavState extends State<BotNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Explorer(),
    Order(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Khám phá',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_on_sharp),
            label: 'Thông báo',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Cá nhân',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
