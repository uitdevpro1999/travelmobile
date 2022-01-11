import 'package:json_annotation/json_annotation.dart';
part 'orderproductdetail.g.dart';
@JsonSerializable()
class OrderProductDetail
{
  int? productId;
  int? quantity;
  int? price;
  int? totalPrice;
  OrderProductDetail({required this.productId,required this.price, required this.quantity, required this.totalPrice});
  @override
  factory OrderProductDetail.fromJson(Map<String,dynamic> json) => _$OrderProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderProductDetailToJson(this);
}