import 'package:flutter/material.dart';


class Attack {
  String name;
  String bonus;
  String damage;

  Attack({
    this.name = "",
    this.bonus = "",
    this.damage = "",
  });
}


class AttackLine extends StatefulWidget {
  const AttackLine({
    super.key,
    required this.attack,
  });

  final Attack attack;

  @override
  State<AttackLine> createState() => _AttackLineState();
}

class _AttackLineState extends State<AttackLine> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
      ]
    );
  }
}