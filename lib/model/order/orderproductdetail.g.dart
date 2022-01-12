// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderproductdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductDetail _$OrderProductDetailFromJson(Map<String, dynamic> json) {
  return OrderProductDetail(
    productId: json['productId'] as int,
    price: json['price'] as int,
    quantity: json['quantity'] as int,
    totalPrice: json['totalPrice'] as int,
  );
}

Map<String, dynamic> _$OrderProductDetailToJson(OrderProductDetail instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'price': instance.price,
      'totalPrice': instance.totalPrice,
    };
