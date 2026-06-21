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