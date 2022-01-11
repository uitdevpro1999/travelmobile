import 'package:flutter/material.dart';
import 'package:travelmobile/page/checkout.dart';
class CartPage extends StatefulWidget {
  int tong;
  int gia;
  int soluong;
  int storeId;
  String name;
  int productId;
  String picture;
  CartPage({Key? key, required this.tong, required this.gia, required this.soluong, required this.storeId,required this.name,required this.productId, required this.picture}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Giỏ hàng"), backgroundColor: Colors.black,),
      body: Stack(
        children:[
          SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){}, child: Text("Shop Thanh Hoá")),
            SizedBox(height: 80 ,width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [

                  SizedBox(height: 60, width: 60, child: Image.network(widget.picture,fit: BoxFit.fill,), ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text(widget.gia.toString()),
                    SizedBox(height: 1,),
                    SizedBox(width:MediaQuery.of(context).size.width*0.5 ,height: 30,
                      child: Stack(
                        children:[
                          Container(color: Colors.white,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){setState(() {
                                    if(widget.soluong > 0){
                                      widget.soluong --;
                                      widget.tong = widget.gia*widget.soluong;
                                    }
                                  });}, icon: Icon(Icons.do_not_disturb_on_outlined,color: Colors.black,),iconSize: 20,),
                                  SizedBox(width: 60,height: 60,
                                    child: Stack(
                                        alignment: AlignmentDirectional.center,
                                        children:[
                                          Container(color: Colors.white,),
                                          Text(widget.soluong.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                        ]
                                    ),
                                  ),
                                  IconButton(onPressed: (){setState(() {
                                    widget.soluong ++;
                                    widget.tong= widget.gia*widget.soluong;
                                  });}, icon: Icon(Icons.add_circle_outline_sharp,color: Colors.black,),iconSize: 20,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],),
              ]
          )
            )
        ]
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
                                  Text(widget.tong.toString()+"đ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),]
                            ),),
                            SizedBox(width: 100,),
                            TextButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Checkout()),
                              );
                            }, child: Text("Xác nhận và Thanh toán"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),),
  ]
      ),
    );
  }
}