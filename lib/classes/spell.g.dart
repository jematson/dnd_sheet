// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) => Spell(
  level: $enumDecode(_$SpellLevelEnumMap, json['level']),
  name: json['name'] as String? ?? "",
  description: json['description'] as String? ?? "",
  prepared: json['prepared'] as bool? ?? false,
);

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
  'level': _$SpellLevelEnumMap[instance.level]!,
  'name': instance.name,
  'description': instance.description,
  'prepared': instance.prepared,
};

const _$SpellLevelEnumMap = {
  SpellLevel.cantrip: 'cantrip',
  SpellLevel.one: 'one',
  SpellLevel.two: 'two',
  SpellLevel.three: 'three',
  SpellLevel.four: 'four',
  SpellLevel.five: 'five',
  SpellLevel.six: 'six',
  SpellLevel.seven: 'seven',
  SpellLevel.eight: 'eight',
  SpellLevel.nine: 'nine',
};
