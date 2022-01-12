import 'package:json_annotation/json_annotation.dart';

import 'orderproductdetail.dart';

part 'orderstoredetail.g.dart';

@JsonSerializable()
class OrderStoreDetail {
  int storeId;
  int totalPrice;
  // alll othervarialble...
  List<OrderProductDetail>? orderProductDetails;

  //initilize all in constructor
  OrderStoreDetail({ required this.storeId, required this.totalPrice ,required this.orderProductDetails });
  @override
  factory OrderStoreDetail.fromJson(Map<String, dynamic> json) => _$OrderStoreDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStoreDetailToJson(this);
}
