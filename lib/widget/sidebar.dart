import 'package:flutter/material.dart';
class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.green,
      child: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,

            child: Image.asset(
              'assets/logo/logo2.png',fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.black12,
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                      Icons.home,
                      size: 23.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Trang chủ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                     Icons.tag,
                      size: 23.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Thực phẩm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                      Icons.tag,
                      size: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 03.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Quà lưu niệm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                      Icons.tag,
                      size: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Thời trang',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                      Icons.tag,
                      size: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Hải sản',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                      Icons.tag,
                      size: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Nông sản',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                ),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Icon(
                      Icons.tag,
                      size: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Bánh kẹo',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
