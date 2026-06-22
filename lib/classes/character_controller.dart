import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dnd_character.dart';


class CharacterController {
  final DNDCharacter character;

  late ValueController name = ValueController(initialValue: character.name, update: (v){character.name = v.valueController.text;});
  late ValueController level = ValueController(initialValue: character.level, update: (v){character.level = v.valueController.text;});
  late ValueController className = ValueController(initialValue: character.className, update: (v){character.className = v.valueController.text;});
  late ValueController race = ValueController(initialValue: character.race, update: (v){character.race = v.valueController.text;});
  late ValueController alignment = ValueController(initialValue: character.alignment, update: (v){character.alignment = v.valueController.text;});
  late ValueController background = ValueController(initialValue: character.background, update: (v){character.background = v.valueController.text;});

  late AbilityController strength = AbilityController(update: (ability){character.strength = ability.scoreController.text;}, initialScore: character.strength);
  late AbilityController dexterity = AbilityController(update: (ability){character.dexterity = ability.scoreController.text;}, initialScore: character.dexterity);
  late AbilityController constitution = AbilityController(update: (ability){character.constitution = ability.scoreController.text;}, initialScore: character.constitution);
  late AbilityController intelligence = AbilityController(update: (ability){character.intelligence = ability.scoreController.text;}, initialScore: character.intelligence);
  late AbilityController wisdom = AbilityController(update: (ability){character.wisdom = ability.scoreController.text;}, initialScore: character.wisdom);
  late AbilityController charisma = AbilityController(update: (ability){character.charisma = ability.scoreController.text;}, initialScore: character.charisma);

  late SkillController strSave = SkillController(
    initialProficiency: character.strProf, 
    update: (skill){character.strProf = skill.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController dexSave = SkillController(
    initialProficiency: character.dexProf, 
    update: (skill){character.dexProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController conSave = SkillController(
    initialProficiency: character.conProf, 
    update: (skill){character.conProf = skill.isProficient.value;}, 
    abilityModController: constitution.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController intSave = SkillController(
    initialProficiency: character.intProf, 
    update: (skill){character.intProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController wisSave = SkillController(
    initialProficiency: character.wisProf, 
    update: (skill){character.wisProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController chaSave = SkillController(
    initialProficiency: character.chaProf, 
    update: (skill){character.chaProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);

  late SkillController acrobatics = SkillController(
    initialProficiency: character.acrobaticsProf, 
    update: (skill){character.acrobaticsProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController animalHandling = SkillController(
    initialProficiency: character.animalHandlingProf, 
    update: (skill){character.animalHandlingProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController arcana = SkillController(
    initialProficiency: character.arcanaProf, 
    update: (skill){character.arcanaProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController athletics  = SkillController(
    initialProficiency: character.athleticsProf, 
    update: (skill){character.athleticsProf = skill.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController deception  = SkillController(
    initialProficiency: character.deceptionProf, 
    update: (skill){character.deceptionProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController history  = SkillController(
    initialProficiency: character.historyProf, 
    update: (skill){character.historyProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController insight  = SkillController(
    initialProficiency: character.insightProf, 
    update: (skill){character.insightProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController intimidation  = SkillController(
    initialProficiency: character.intimidationProf, 
    update: (skill){character.intimidationProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController investigation  = SkillController(
    initialProficiency: character.investigationProf, 
    update: (skill){character.investigationProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController medicine  = SkillController(
    initialProficiency: character.medicineProf, 
    update: (skill){character.medicineProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController nature  = SkillController(
    initialProficiency: character.natureProf, 
    update: (skill){character.natureProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController perception  = SkillController(
    initialProficiency: character.perceptionProf, 
    update: (skill){character.perceptionProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController performance  = SkillController(
    initialProficiency: character.performanceProf, 
    update: (skill){character.performanceProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController persuasion  = SkillController(
    initialProficiency: character.persuasionProf, 
    update: (skill){character.persuasionProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController religion  = SkillController(
    initialProficiency: character.religionProf, 
    update: (skill){character.religionProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController sleightOfHand  = SkillController(
    initialProficiency: character.sleightOfHandProf, 
    update: (skill){character.sleightOfHandProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController stealth  = SkillController(
    initialProficiency: character.stealthProf, 
    update: (skill){character.stealthProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController survival = SkillController(
    initialProficiency: character.survivalProf, 
    update: (skill){character.survivalProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);


  late final ProficiencyController proficiencyBonus = ProficiencyController(
    levelController: level.valueController, 
    initialValue: character.proficiencyBonus, 
    update: (prof){character.proficiencyBonus = prof.profBonusController.text;});
  late ValueController passivePerception = ValueController(initialValue: character.passivePerception, update: (v){character.passivePerception = v.valueController.text;});
  late ValueController inspiration = ValueController(initialValue: character.inspiration, update: (v){character.inspiration = v.valueController.text;});

  late ValueController ac = ValueController(initialValue: character.armorClass, update: (v){character.armorClass = v.valueController.text;});
  late ValueController initiative = ValueController(initialValue: character.initiative, update: (v){character.initiative = v.valueController.text;});
  late ValueController speed = ValueController(initialValue: character.speed, update: (v){character.speed = v.valueController.text;});

  late ValueController hpMax = ValueController(initialValue: character.hpMax, update: (v){character.hpMax = v.valueController.text;});
  late ValueController hpCurr = ValueController(initialValue: character.hpCurr, update: (v){character.hpCurr = v.valueController.text;});
  late ValueController hpTemp = ValueController(initialValue: character.hpTemp, update: (v){character.hpTemp = v.valueController.text;});

  late ValueController hitDiceTotal = ValueController(initialValue: character.hitDiceTotal, update: (v){character.hitDiceTotal = v.valueController.text;});
  late ValueController hitDiceCurr = ValueController(initialValue: character.hitDiceCurr, update: (v){character.hitDiceCurr = v.valueController.text;});

  late ValueController cp = ValueController(initialValue: character.cp, update: (v){character.cp = v.valueController.text;});
  late ValueController sp = ValueController(initialValue: character.sp, update: (v){character.sp = v.valueController.text;});
  late ValueController ep = ValueController(initialValue: character.ep, update: (v){character.ep = v.valueController.text;});
  late ValueController gp = ValueController(initialValue: character.gp, update: (v){character.gp = v.valueController.text;});
  late ValueController pp = ValueController(initialValue: character.pp, update: (v){character.pp = v.valueController.text;});
  late ValueController inventory = ValueController(initialValue: character.inventory, update: (v){character.inventory = v.valueController.text;});

  late ValueController proficiencies = ValueController(initialValue: character.proficiencies, update: (v){character.proficiencies = v.valueController.text;});
  late ValueController featuresTraits = ValueController(initialValue: character.featuresTraits, update: (v){character.featuresTraits = v.valueController.text;});

  late ValueController spellcastingClass = ValueController(initialValue: character.spellcastingClass, update: (v){character.spellcastingClass = v.valueController.text;});
  late ValueController spellcastingAbility = ValueController(initialValue: character.spellcastingAbility, update: (v){character.spellcastingAbility = v.valueController.text;});
  late ValueController spellSaveDC = ValueController(initialValue: character.spellSaveDC, update: (v){character.spellSaveDC = v.valueController.text;});
  late ValueController spellAttackBonus = ValueController(initialValue: character.spellAttackBonus, update: (v){character.spellAttackBonus = v.valueController.text;});

  late ValueController backstory = ValueController(initialValue: character.backstory, update: (v){character.backstory = v.valueController.text;});
  late ValueController age = ValueController(initialValue: character.age, update: (v){character.age = v.valueController.text;});
  late ValueController height = ValueController(initialValue: character.height, update: (v){character.height = v.valueController.text;});
  late ValueController weight = ValueController(initialValue: character.weight, update: (v){character.weight = v.valueController.text;});
  late ValueController eyes = ValueController(initialValue: character.eyes, update: (v){character.eyes = v.valueController.text;});
  late ValueController skin = ValueController(initialValue: character.skin, update: (v){character.skin = v.valueController.text;});
  late ValueController hair = ValueController(initialValue: character.hair, update: (v){character.hair = v.valueController.text;});
  late ValueController personalityTraits = ValueController(initialValue: character.personalityTraits, update: (v){character.personalityTraits = v.valueController.text;});
  late ValueController ideals = ValueController(initialValue: character.ideals, update: (v){character.ideals = v.valueController.text;});
  late ValueController bonds = ValueController(initialValue: character.bonds, update: (v){character.bonds = v.valueController.text;});
  late ValueController flaws = ValueController(initialValue: character.flaws, update: (v){character.flaws = v.valueController.text;});

  late ValueController sessionNotes = ValueController(initialValue: character.sessionNotes, update: (v){character.sessionNotes = v.valueController.text;});


  CharacterController({
    required this.character
  });

  void dispose() {
    name.dispose();
    level.dispose();
    className.dispose();
    race.dispose();
    alignment.dispose();
    background.dispose();

    strength.dispose();
    dexterity.dispose();
    constitution.dispose();
    intelligence.dispose();
    wisdom.dispose();
    charisma.dispose();

    strSave.dispose();
    dexSave.dispose();
    conSave.dispose();
    intSave.dispose();
    wisSave.dispose();
    chaSave.dispose();

    acrobatics.dispose();
    animalHandling.dispose();
    arcana.dispose();
    athletics.dispose();
    deception.dispose();
    history.dispose();
    insight.dispose();
    intimidation.dispose();
    investigation.dispose();
    medicine.dispose();
    nature.dispose();
    perception.dispose();
    performance.dispose();
    persuasion.dispose();
    religion.dispose();
    sleightOfHand.dispose();
    stealth.dispose();
    survival.dispose();
    
    proficiencyBonus.dispose();
    passivePerception.dispose();
    inspiration.dispose();
    
    ac.dispose();
    initiative.dispose();
    speed.dispose();
    
    hpCurr.dispose();
    hpMax.dispose();
    hpTemp.dispose();
    
    hitDiceCurr.dispose();
    hitDiceTotal.dispose();
    
    cp.dispose();
    sp.dispose();
    ep.dispose();
    gp.dispose();
    pp.dispose();
    inventory.dispose();
    
    proficiencies.dispose();
    featuresTraits.dispose();
    
    spellcastingAbility.dispose();
    spellcastingClass.dispose();
    spellSaveDC.dispose();
    spellAttackBonus.dispose();
    
    backstory.dispose();
    age.dispose();
    height.dispose();
    weight.dispose();
    eyes.dispose();
    skin.dispose();
    hair.dispose();
    personalityTraits.dispose();
    ideals.dispose();
    bonds.dispose();
    flaws.dispose();
    
    sessionNotes.dispose();
    
  }
}



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