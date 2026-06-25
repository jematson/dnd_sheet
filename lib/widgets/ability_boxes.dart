/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-20 12:34
 *   Modified by: Jenae Matson
 *   Modified time: 2026-06-24 17:50
 *   Description: Widgets for displaying Ability Scores, Saving 
 *                Throws, and Skills on the Character Page.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets.dart';
import '../classes/classes.dart';

class SkillLine extends StatelessWidget {
  final String value;
  final SkillController skill;

  const SkillLine({
    super.key,
    required this.value,
    required this.skill,
  });


    @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: skill.isProficient,
          builder: (_, proficient, _) {
            return SizedBox(
              width: 30,
              height: 30,
              child: IconButton(
                iconSize: 15,
                icon: Icon(proficient ? Icons.circle : Icons.circle_outlined),
                onPressed: () {
                  skill.isProficient.value = !skill.isProficient.value;
                },
              ),
            );
          }
        ),
        SizedBox(
          width: 25,
          child: TextField(
            readOnly: true,
            controller: skill.skillController,
            textAlign: .center,
            style: TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
            ),
          )
        ),
        Text(
          value,
          style: TextStyle(fontSize: 12)
        )
      ]
    );
  }
}




class AbilityBox extends StatelessWidget {
  const AbilityBox({
    super.key,
    required this.value,
    required this.controller,
    required this.modController,
  });

  final String value;
  final TextEditingController controller;
  final TextEditingController modController;

  @override
  Widget build(BuildContext context) {
    return CardSection(
      child: Column(
        children: [
          Text(
            value,
            textAlign: .center,
            style: TextStyle(fontSize: 12)
          ),
          SizedBox(
            width: 50,
            child: TextField(
              controller: controller,
              textAlign: .center,
              textAlignVertical: .center,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(
            width: 27,
            height: 27,
            child: TextField(
              readOnly: true,
              controller: modController,
              textAlign: .center,
              textAlignVertical: .center,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 1),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
            ),
          ),
        ],
      ),
    );
  }
}