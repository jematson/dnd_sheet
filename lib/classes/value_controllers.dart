/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-22 17:05
 *   Modified by: Jenae Matson
 *   Modified time: 2026-06-24 17:49
 *   Description: Controller classes for various widgets on 
 *                the Character Sheet page.
 */

import 'package:flutter/material.dart';
import './classes.dart';


class ValueController {
  final valueController = TextEditingController();
  final String initialValue;
  final void Function(ValueController) update;

  ValueController({
    required this.initialValue,
    required this.update,
  }) {
    valueController.text = initialValue;
    valueController.addListener((){update(this);});
  }

  void dispose() {
    valueController.dispose();
  }
}



class AbilityController {
  final scoreController = TextEditingController();
  final modifierController = TextEditingController();
  final void Function(AbilityController) update;
  final String initialScore;

  AbilityController({
    required this.update,
    required this.initialScore
  }) {
    scoreController.text = initialScore;
    scoreController.addListener(_updateAbilityModifier);
    _updateAbilityModifier();
  }

  void _updateAbilityModifier() {
    final score = int.tryParse(scoreController.text);
    if (score != null) {
      final mod = ((score - 10) / 2).floor();
      modifierController.text = mod < 0 ? mod.toString() : "+${mod.toString()}";
      update(this);
    } else {
      modifierController.text = "";
    }
  }

  void dispose() {
    scoreController.dispose();
    modifierController.dispose();
  }
}



class ProficiencyController {
  final profBonusController = TextEditingController();
  final TextEditingController levelController;
  final String initialValue;
  final void Function(ProficiencyController) update;

  ProficiencyController({
    required this.levelController,
    required this.initialValue,
    required this.update,
  }) {
    profBonusController.text = initialValue;
    levelController.addListener(_updateProficiencyBonus);
    _updateProficiencyBonus();
  }

  void _updateProficiencyBonus() {
    if (levelController.text == "1" || 
        levelController.text == "2" || 
        levelController.text == "3" || 
        levelController.text == "4") {
      profBonusController.text = "2";
    } else if (levelController.text == "5" || 
               levelController.text == "6" || 
               levelController.text == "7" || 
               levelController.text == "8") {
      profBonusController.text = "3";
    } else if (levelController.text == "9" || 
               levelController.text == "10" || 
               levelController.text == "11" || 
               levelController.text == "12") {
      profBonusController.text = "4";
    } else if (levelController.text == "13" || 
               levelController.text == "14" || 
               levelController.text == "15" || 
               levelController.text == "16") {
      profBonusController.text = "5";
    } else if (levelController.text == "17" || 
               levelController.text == "18" || 
               levelController.text == "19" || 
               levelController.text == "20") {
      profBonusController.text = "6";
    }
    update(this);
  }

  void dispose() {
    profBonusController.dispose();
    levelController.removeListener(_updateProficiencyBonus);
  }
}



class SkillController {
  final skillController = TextEditingController();
  final bool initialProficiency;
  ValueNotifier<bool> isProficient = ValueNotifier<bool>(false);
  final TextEditingController abilityModController;
  final TextEditingController proficiencyController;
  final void Function(SkillController) update;

  SkillController({
    required this.initialProficiency,
    required this.update,
    required this.abilityModController,
    required this.proficiencyController,
  }) {
    isProficient.value = initialProficiency;
    proficiencyController.addListener(_updateSkillBonus);
    abilityModController.addListener(_updateSkillBonus);
    isProficient.addListener(_updateSkillBonus);
    _updateSkillBonus();
  }

  void _updateSkillBonus() {
    final mod = int.tryParse(abilityModController.text);
    if (mod != null) {
      final prof = int.tryParse(proficiencyController.text);
      if (prof != null && isProficient.value) {
        final num = mod + prof;
        skillController.text = num < 0 ? num.toString() : "+${num.toString()}";
      } else {
        skillController.text = mod < 0 ? mod.toString() : "+${mod.toString()}";
      }
    } else {
      skillController.text = "";
    }
    update(this);
  }

  void dispose() {
    skillController.dispose();
    isProficient.dispose();
    proficiencyController.removeListener(_updateSkillBonus);
    abilityModController.removeListener(_updateSkillBonus);
  }
}



class DeathSavesController {
  final bool initialS1;
  final bool initialS2;
  final bool initialS3;
  final bool initialF1;
  final bool initialF2;
  final bool initialF3;
  ValueNotifier<bool> s1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> s2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> s3 = ValueNotifier<bool>(false);
  ValueNotifier<bool> f1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> f2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> f3 = ValueNotifier<bool>(false);
  final void Function(DeathSavesController) update;

  DeathSavesController({
    required this.initialS1,
    required this.initialS2,
    required this.initialS3,
    required this.initialF1,
    required this.initialF2,
    required this.initialF3,
    required this.update,
  }) {
    s1.value = initialS1;
    s2.value = initialS2;
    s3.value = initialS3;
    f1.value = initialF1;
    f2.value = initialF2;
    f3.value = initialF3;
    s1.addListener((){update(this);});
    s2.addListener((){update(this);});
    s3.addListener((){update(this);});
    f1.addListener((){update(this);});
    f2.addListener((){update(this);});
    f3.addListener((){update(this);});
  }

  void dispose() {
    s1.dispose();
    s2.dispose();
    s3.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
  }
}



class SpellSectionController {
  final SpellLevelSection initialSpellSection;
  TextEditingController slotsTotalController = TextEditingController();
  TextEditingController slotsExpendedController = TextEditingController();
  ValueNotifier<List<Spell>> spellsController = ValueNotifier<List<Spell>>([]);
  final void Function(SpellSectionController) update;

  SpellSectionController({
    required this.initialSpellSection,
    required this.update,
  }) {
    spellsController.value = initialSpellSection.spells;
    slotsTotalController.text = initialSpellSection.slotsTotal;
    slotsExpendedController.text = initialSpellSection.slotsExpended;
    spellsController.addListener((){update(this);});
    slotsExpendedController.addListener((){update(this);});
    slotsTotalController.addListener((){update(this);});
  }

  void dispose() {
    slotsExpendedController.dispose();
    slotsTotalController.dispose();
    spellsController.dispose();
  }
}



class AttackController {
  final Attack attack;
  TextEditingController nameController = TextEditingController();
  TextEditingController bonusController = TextEditingController();
  TextEditingController damageController = TextEditingController();
  final void Function(AttackController) update;

  AttackController({
    required this.attack,
    required this.update,
  }) {
    nameController.text = attack.name;
    bonusController.text = attack.bonus;
    damageController.text = attack.damage;

    nameController.addListener((){
      attack.name = nameController.text;
      update(this);
    });

    bonusController.addListener((){
      attack.bonus = bonusController.text;
      update(this);
    });

    damageController.addListener((){
      attack.damage = damageController.text;
      update(this);
    });
  }

  void dispose() {
    nameController.dispose();
    bonusController.dispose();
    damageController.dispose();
  }
}



class AttackSectionController {
  late final List<AttackController> controllers = [];
  final List<Attack> initialAttacks;
  ValueNotifier<List<Attack>> attacks = ValueNotifier<List<Attack>>([]);
  final void Function(AttackSectionController) update;

  AttackSectionController({
    required this.initialAttacks,
    required this.update,
  }) {
    attacks.value = initialAttacks;

    for (int i = 0; i < attacks.value.length; i++) {
      controllers.add(AttackController(
        attack: attacks.value[i], 
        update: (c){
          final newList = List<Attack>.from(attacks.value);
          newList[i] = c.attack;
          attacks.value = newList;
        }));
    }

    attacks.addListener((){update(this);});
  }
}