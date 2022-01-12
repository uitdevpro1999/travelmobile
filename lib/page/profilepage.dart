import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelmobile/model/account/address.dart';

import '../model/account/account.dart';
import 'updateprofile.dart';
class Profile extends StatefulWidget {
  Profile({Key? key}) : super (key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile>{
  @override
  CircleAvatar _avatar(data1){
    return CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage(data1.avatar),
    );
  }
  Column _body(data){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<Account>(
          future: getAccount(),
          builder:  (context, snapshot) {
            if (snapshot.hasData) {
              Account? data1 = snapshot.data;
               return _avatar(data1);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },

        ),

        Text(
          data.username,
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 25,
          ),
        ),
        Text(
          'Welcome',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'SourceSansPro',
            color: Colors.red[400],
            letterSpacing: 2.5,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 200,
          child: Divider(
            color: Colors.teal[100],
          ),
        ),
        Card(
            color: Colors.white,
            margin:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.teal[900],
              ),
              title: Text(
                data.phone,
                style:
                TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
              ),
            )),
        Card(
          color: Colors.white,
          margin:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.teal[900],
            ),
            title: Text(
              data.houseNumberStreet,
              style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
            ),
          ),
        ),
        Card(
          color: Colors.white,
          margin:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.location_city,
              color: Colors.teal[900],
            ),
            title: Text(
              data.address,
              style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo[600],
              elevation: 0.0,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.all(18.0),
            ),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Update(add: data.address, street: data.houseNumberStreet, phone: data.phone)));
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: 70.0, top: 0.0, right: 70.0, bottom: 0.0),
              child: Text(
                'Cập nhật thông tin',
                style: TextStyle(color: Colors.white),

              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column( children:[FutureBuilder<Address>(
          future: getAddress(),
            builder:  (context, snapshot) {
              if (snapshot.hasData) {
                Address? data = snapshot.data;
                return _body(data);
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Không thể tải, vui lòng đăng nhập lại hoặc cập nhật thông tin nếu chưa có thông tin'),
                    SizedBox(height: 10,),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo[600],
                          elevation: 0.0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Update(add: "", street: "", phone: "")));
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 70.0, top: 0.0, right: 70.0, bottom: 0.0),
                          child: Text(
                            'Cập nhật thông tin',
                            style: TextStyle(color: Colors.white),

                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),

            ]

          )
        ),
      ),
    );
  }
}