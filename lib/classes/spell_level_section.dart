/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-21 11:50
 *   Modified by: Jenae Matson
 *   Modified time: 2026-06-24 17:39
 *   Description: Class to define a level of spells object.
 */

import './classes.dart';
import 'package:json_annotation/json_annotation.dart';


part 'spell_level_section.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellLevelSection {
  List<Spell> spells;
  String slotsTotal;
  String slotsExpended;

  SpellLevelSection({
    List<Spell>? spells,
    this.slotsTotal = "",
    this.slotsExpended = "",
  }) : spells = spells ?? [];

  factory SpellLevelSection.fromJson(Map<String, dynamic> json) =>
      _$SpellLevelSectionFromJson(json);

  Map<String, dynamic> toJson() => _$SpellLevelSectionToJson(this);
}