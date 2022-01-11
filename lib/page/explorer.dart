import 'package:flutter/material.dart';
class Explorer extends StatefulWidget{
  Explorer({Key? key}) : super(key:key);
  @override
  _ExplorerState createState() => _ExplorerState();
}
class _ExplorerState extends State<Explorer>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(backgroundColor: Colors.green,),
         body:ListView(
         children: [
         GestureDetector(
         child: Card(
           elevation: 3,
           color: Colors.white,
           child: Row(
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width * 0.30,
                 child: Image.network("https://toptour.com.vn/wp-content/uploads/2019/08/nhung-dia-diem-dep1.jpg", fit: BoxFit.cover),
               ),
               SizedBox(width: 10,),
               Flexible(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       "Top 9 cảnh đẹp ở Việt Nam đáng du lịch",
                       style: new TextStyle(
                           fontSize: 15.0, fontWeight: FontWeight.bold),
                     ),
                     SizedBox(height: 10,),
                     new Text(
                       "Hà Nội, Hạ Long và nhiều hơn thế",
                       style: new TextStyle(
                         fontSize: 14.0,
                         fontWeight: FontWeight.normal,
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
      onTap: () {},
    ),
           GestureDetector(
             child: Card(
               elevation: 3,
               color: Colors.white,
               child: Row(
                 children: [
                   SizedBox(
                     width: MediaQuery.of(context).size.width * 0.30,
                     child: Image.network("https://angiangtourism.vn/kinh-nghiem-di-coto/imager_16204.jpg", fit: BoxFit.cover),
                   ),
                   SizedBox(width: 10,),
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "Cẩm nang đi du lịch Cô Tô",
                           style: new TextStyle(
                               fontSize: 15.0, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: 10,),
                         new Text(
                           "Bí quyết để tận hưởng một chuyến du lịch Cô Tô tuyệt vời",
                           style: new TextStyle(
                             fontSize: 14.0,
                             fontWeight: FontWeight.normal,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             onTap: () {},
           ),
    ],
    ),
    );
  }
}