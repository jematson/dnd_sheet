/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-19 22:46
 *   Modified by: Jenae Matson
 *   Modified time: 2026-06-24 17:50
 *   Description: Widgets for displaying the Attack section 
 *                on the Character Page.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/classes.dart';

FilteringTextInputFormatter numeric = FilteringTextInputFormatter.allow(RegExp("[0-9]"));
FilteringTextInputFormatter numericPlus = FilteringTextInputFormatter.allow(RegExp("[0-9+-]"));


class AttackLine extends StatelessWidget {
  final AttackController attack;
  final void Function() deleteAttack;
  final focusNode = FocusNode();
  

  AttackLine({
    super.key,
    required this.attack,
    required this.deleteAttack,
  });



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Focus(
            focusNode: focusNode,
            child: TextField(
              controller: attack.nameController,
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
                  attack.nameController.text.isEmpty) {
                
                deleteAttack();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            }
          ),
        ),
        SizedBox(
          width: 40,
          child: TextField(
            controller: attack.bonusController,
            style: TextStyle(fontSize: 12),
            inputFormatters: [numericPlus],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2.0)
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: attack.damageController,
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



class AttackSection extends StatelessWidget {
  final AttackSectionController attacksController;

  const AttackSection({
    super.key,
    required this.attacksController,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: attacksController.attacks,
      builder: (_, attacks, _) {
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
                  attack: attacksController.controllers[index],
                  deleteAttack: () {
                    final newList = List<Attack>.from(attacks);
                    newList.removeAt(index);
                    attacksController.attacks.value = newList;
                    attacksController.controllers.removeAt(index);
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
                      final newAttack = Attack();
                      attacksController.controllers.add(AttackController(
                        attack: newAttack, 
                        update: (c){
                          final newList = List<Attack>.from(attacksController.attacks.value);
                          newList[attacksController.attacks.value.length - 1] = c.attack;
                          attacksController.attacks.value = newList;
                        }));
                      attacksController.attacks.value = [...attacks, newAttack];
                    },
                  ),
                ),
              ],
            )
          ]
        );
      }
    );
  }
}