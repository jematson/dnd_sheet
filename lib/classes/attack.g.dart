// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attack _$AttackFromJson(Map<String, dynamic> json) => Attack(
  name: json['name'] as String? ?? "",
  bonus: json['bonus'] as String? ?? "",
  damage: json['damage'] as String? ?? "",
);

Map<String, dynamic> _$AttackToJson(Attack instance) => <String, dynamic>{
  'name': instance.name,
  'bonus': instance.bonus,
  'damage': instance.damage,
};
