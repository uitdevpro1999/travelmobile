// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return OrderDetail(
    status: json['status'] as String,
    userId: json['userId'] as int,
    totalPrice: json['totalPrice'] as int,
    receiverName: json['receiverName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    houseNumberStreet: json['houseNumberStreet'] as String,
    address: json['address'] as String,
    paymentMethod: json['paymentMethod'] as String,
    shipmentMethod: json['shipmentMethod'] as String,
    id: json['id'] as int,
    orderStoreDetails:
        (json['orderStoreDetails'] as List<dynamic>)
            .map((e) => OrderStoreDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'totalPrice': instance.totalPrice,
      'receiverName': instance.receiverName,
      'email': instance.email,
      'phone': instance.phone,
      'houseNumberStreet': instance.houseNumberStreet,
      'address': instance.address,
      'shipmentMethod': instance.shipmentMethod,
      'paymentMethod': instance.paymentMethod,
      'orderStoreDetails': instance.orderStoreDetails,
    };
