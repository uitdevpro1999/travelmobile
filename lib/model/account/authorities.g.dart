// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorities _$AuthoritiesFromJson(Map<String, dynamic> json) {
  return Authorities(
    userId: json['userId'] as int?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$AuthoritiesToJson(Authorities instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
    };
