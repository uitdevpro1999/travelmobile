// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderstoredetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStoreDetail _$OrderStoreDetailFromJson(Map<String, dynamic> json) {
  return OrderStoreDetail(
    id: json['id'] as int,
    orderId: json['orderId'] as int,
    status: json['status'] as String,
    storeId: json['storeId'] as int,
    totalPrice: json['totalPrice'] as int,
    orderProductDetailEntities:
        (json['orderProductDetailEntities'] as List<dynamic>?)
            ?.map((e) => OrderProductDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

Map<String, dynamic> _$OrderStoreDetailToJson(OrderStoreDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'storeId': instance.storeId,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'orderProductDetailEntities': instance.orderProductDetailEntities,
    };
