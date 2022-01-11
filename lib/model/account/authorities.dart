import 'package:json_annotation/json_annotation.dart';
part 'authorities.g.dart';
@JsonSerializable()
class Authorities
{
  int? userId;
  String? name;
  Authorities({required this.userId,required this.name});
  @override
  factory Authorities.fromJson(Map<String,dynamic> json) => _$AuthoritiesFromJson(json);
  Map<String, dynamic> toJson() => _$AuthoritiesToJson(this);
}