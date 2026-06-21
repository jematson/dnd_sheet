// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_level_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellLevelSection _$SpellLevelSectionFromJson(Map<String, dynamic> json) =>
    SpellLevelSection(
      spells: (json['spells'] as List<dynamic>?)
          ?.map((e) => Spell.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      slotsTotal: json['slotsTotal'] as String? ?? "",
      slotsExpended: json['slotsExpended'] as String? ?? "",
    );

Map<String, dynamic> _$SpellLevelSectionToJson(SpellLevelSection instance) =>
    <String, dynamic>{
      'spells': instance.spells,
      'slotsTotal': instance.slotsTotal,
      'slotsExpended': instance.slotsExpended,
    };
