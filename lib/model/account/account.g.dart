// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as int?,
    userName: json['userName'] as String?,
    email: json['email'] as String?,
    storeId: json['storeId'] as int?,
    avatar: json['avatar'] as String?,
    activated: json['activated'] as bool?,
    authorities: (json['authorities'] as List<dynamic>)
        .map((e) => Authorities.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'storeId': instance.storeId,
      'avatar': instance.avatar,
      'activated': instance.activated,
      'authorities': instance.authorities,
    };
