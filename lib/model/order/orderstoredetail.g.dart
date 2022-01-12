// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderstoredetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStoreDetail _$OrderStoreDetailFromJson(Map<String, dynamic> json) {
  return OrderStoreDetail(
    storeId: json['storeId'] as int,
    totalPrice: json['totalPrice'] as int,
    orderProductDetails: (json['orderProductDetails'] as List<dynamic>).map((e) => OrderProductDetail.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$OrderStoreDetailToJson(OrderStoreDetail instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'totalPrice': instance.totalPrice,
      'orderProductDetails': instance.orderProductDetails,
    };
