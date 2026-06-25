/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-20 17:55
 *   Modified by: Jenae Matson
 *   Modified time: 2026-06-24 17:43
 *   Description: Class to define an Attack object.
 */

import 'package:json_annotation/json_annotation.dart';
part 'attack.g.dart';


@JsonSerializable()
class Attack {
  String name;
  String bonus;
  String damage;

  Attack({
    this.name = "",
    this.bonus = "",
    this.damage = "",
  });

  factory Attack.fromJson(Map<String, dynamic> json) =>
    _$AttackFromJson(json);

  Map<String, dynamic> toJson() => _$AttackToJson(this);
}