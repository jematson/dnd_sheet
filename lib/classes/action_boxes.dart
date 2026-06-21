import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    required this.deleteAttack,
  });

  final Attack attack;
  final void Function() deleteAttack;

  @override
  State<AttackLine> createState() => _AttackLineState();
}

class _AttackLineState extends State<AttackLine> {
  @override
  void initState() {
    super.initState();
  }

  final focusNode = FocusNode();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Focus(
            focusNode: focusNode,
            child: TextField(
              controller: nameController,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2.0)
              ),
            ),
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent && 
                  event.logicalKey == LogicalKeyboardKey.backspace &&
                  nameController.text.isEmpty) {
                
                widget.deleteAttack();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            }
          ),
        ),
        SizedBox(
          width: 40,
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2.0)
            ),
          ),
        ),
        Expanded(
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2.0)
            ),
          ),
        ),
      ]
    );
  }
}



class AttackSection extends StatefulWidget {
  const AttackSection({
    super.key,
  });

  @override
  State<AttackSection> createState() => _AttackSectionState();
}

class _AttackSectionState extends State<AttackSection> {
  @override
  void initState() {
    super.initState();
  }

  var attacks = <Attack>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Name", style: TextStyle(fontSize: 10))
            ),
            SizedBox(
              width: 40,
              child: Text("Bonus", style: TextStyle(fontSize: 10))
            ),
            Expanded(
              child: Text("Damage", style: TextStyle(fontSize: 10))
            ),
          ]
        ),

        Column(
          spacing: 5,
          children: List.generate(
            attacks.length,
            (index) => AttackLine(
              attack: attacks[index],
              deleteAttack: () {
                setState(() {
                  attacks.removeAt(index);
                });
              }
            ),
          )
        ),

        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("ATTACKS", style: TextStyle(fontSize: 10, fontWeight: .bold)),
            SizedBox(
              width: 40,
              height: 30,
              child: IconButton(
                iconSize: 18,
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    attacks.add(Attack());
                  });
                },
              ),
            ),
          ],
        )
      ]
    );
  }
}