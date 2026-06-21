import './classes.dart';
import 'package:json_annotation/json_annotation.dart';


part 'spell_level_section.g.dart';

@JsonSerializable()
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