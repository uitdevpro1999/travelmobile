import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travelmobile/model/order/orderproductdetail.dart';
import 'package:travelmobile/model/order/orderstoredetail.dart';
import 'package:travelmobile/model/product.dart';
import 'package:travelmobile/page/cartpage.dart';
import 'package:travelmobile/widget/toast.dart';

import '../model/store.dart';
import 'store.dart';
class Detail extends StatefulWidget{
  int? uid;


  Detail({Key? key, required this.uid }): super (key: key);
  @override
  _DetailState createState() => _DetailState();
}
class _DetailState extends State<Detail>{
  late List<OrderProductDetail> orderproduct;
  bool _expanded = true;
  bool _expanded1 = false;
  int soluong =0 ;
  int gia = 70000;
  int tong =0;
  String storeName="";
  @override
  Stack _detail(data){
    return Stack(
      children: [


        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(height:MediaQuery.of(context).size.height *0.4,width: MediaQuery.of(context).size.width,
                  child: Image.network(data.imagelink,fit: BoxFit.fill,) ),
              SizedBox(height: MediaQuery.of(context).size.height*0.12,width: MediaQuery.of(context).size.width ,
                child:Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height:10),
                      Text(data.price.toString()+" đ",style: TextStyle(color: Colors.red),)
                    ],
                  ) ,
                ),
              ),
                FutureBuilder<Store>(
                 future: fetchStore(data.storeId),
                     builder:  (context, snapshot) {
                     if (snapshot.hasData) {
                        Store? data1 = snapshot.data;
                        storeName= data1!.name;
                        return SizedBox(height: MediaQuery.of(context).size.height*0.1,width: MediaQuery.of(context).size.width ,
                       child: Card(
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: MediaQuery.of(context).size.height*0.1,width: MediaQuery.of(context).size.width*0.2 ,
                               child: Image.network("https://image-us.eva.vn/upload/3-2021/images/2021-08-04/chi-em-mua-sam-online-dung-quen-cho-vao-gio-ngay-nhung-loai-thuc-pham-de-tru-de-nau-nay-bach-hoa-2-1628047095-790-width600height833.jpg",fit: BoxFit.fill,) ,),
                             SizedBox(width: 25,),
                             Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   SizedBox(height: 15,),
                                   Text(data1.name),
                                 ]
                             ),
                             SizedBox(width: 60,),
                            TextButton(onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => StorePage(storeId: data1.id, storeName: data1.name)));
                            },
                              child: Text("Xem cửa hàng",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),),
                           ],
                         ),),);
                   } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                    }

    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                     },),
            Card(
                child:Row(children: [
                  SizedBox(width: 10,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("ID sản phẩm:" + data.id.toString()),
                        SizedBox(height: 20,),
                        Text("Số lượng hàng trong kho: "+ data.stock.toString()),
                        SizedBox(height: 20,),
                        Text("Xuất xứ: "+ data.productLocation),
                        SizedBox(height: 20,),
                        Text("Loại sản phẩm: "+ data.productType),
                      ]
                  ),
                ],),
             ),
            SizedBox(width: 90,),
              Container(
                margin: EdgeInsets.all(5),
                color: Colors.green,
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 2000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Thông tin sản phẩm', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                        );
                      },
                      body:ListTile(
                        title: Text(data.description,style: TextStyle(color: Colors.black)),
                      ),
                      isExpanded: _expanded,
                      canTapOnHeader: true,
                    ),

                  ],
                  dividerColor: Colors.grey,
                  expansionCallback: (panelIndex, isExpanded) {
                    _expanded = !_expanded;
                    setState(() {
                    });
                  },

                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                color: Colors.green,
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 2000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text('Đánh giá từ khách hàng', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                        );
                      },
                      body: ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: [

                              SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nguyễn Thị Thanh Trà",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10,),
                                    new Text(
                                      "Ngon lắm :D",
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
                          SizedBox(height: 10,),
                          Row(
                            children: [

                              SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nguyễn Thị Hà",
                                      style: new TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10,),
                                    new Text(
                                      "Ngon, bổ, rẻ",
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
                        ],
                      ),
                      isExpanded: _expanded1,
                      canTapOnHeader: true,
                    ),
                  ],
                  dividerColor: Colors.grey,
                  expansionCallback: (panelIndex, isExpanded) {
                    _expanded1 = !_expanded1;
                    setState(() {
                    });
                  },

                ),
              ),
              SizedBox(height: 70),
            ],

          ),
        ),
        Positioned(
          child: new Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: 50.0,
              child: Material(
                elevation: 0.0,
                child:  SizedBox(width:MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height*0.07,
                  child: Stack(
                    children:[
                      Container(color: Colors.black,),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          SizedBox(height: 50 ,width: 100,child:Column(
                              children:[
                                SizedBox(height: 20),
                                Text("$tong đ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),]
                          ),),

                          Row(
                            children: [
                              IconButton(onPressed: (){setState(() {
                                if(soluong>0){
                                  soluong --;
                                  tong= data.price*soluong;}
                              });}, icon: Icon(Icons.do_not_disturb_on_outlined,color: Colors.white,)),
                              SizedBox(width: 60,height: 30,
                                child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children:[
                                      Container(color: Colors.white,),
                                      Text("$soluong",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                    ]
                                ),
                              ),
                              IconButton(onPressed: (){setState(() {
                                soluong ++;
                                tong= data.price*soluong;
                              });}, icon: Icon(Icons.add_circle_outline_sharp,color: Colors.white,)),
                            ],
                          ),
                          TextButton(onPressed: (){
                            if(soluong==0){
                             var toast= ProjectToast(msg: "Bạn chưa chọn số lượng, vui lòng thử lại");
                             toast.pshowToast();}
                            else{
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => CartPage(tong: tong, gia: data.price, soluong: soluong, storeId: data.storeId,name: data.name,productId: data.id, picture: data.imagelink,storeName: storeName)));
                            }
                          }, child: Text("Mua ngay"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),),
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: Text("Chi tiết"),),
      body: Center(
          child: FutureBuilder<Product>(
          future: fetchdetailProduct(widget.uid),
           builder:  (context, snapshot) {
             if (snapshot.hasData) {
               Product? data = snapshot.data;
              return _detail(data);
              } else if (snapshot.hasError) {
               return Text('${snapshot.error}');
              }

             // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
      ),
      ),
    );
  }
  void add() {
  }
}