import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dnd_character.dart';


class CharacterController {
  final DNDCharacter character;

  late final TextEditingController nameController = TextEditingController(text: character.name);
  late final TextEditingController levelController = TextEditingController(text: character.level);
  late final TextEditingController classController = TextEditingController(text: character.className);
  late final TextEditingController raceController = TextEditingController(text: character.race);
  late final TextEditingController alignmentController = TextEditingController(text: character.alignment);
  late final TextEditingController backgroundController = TextEditingController(text: character.background);

  late AbilityController strength = AbilityController(update: (){character.strength = strength.scoreController.text;}, initialScore: character.strength);
  late AbilityController dexterity = AbilityController(update: (){character.dexterity = dexterity.scoreController.text;}, initialScore: character.dexterity);
  late AbilityController constitution = AbilityController(update: (){character.constitution = constitution.scoreController.text;}, initialScore: character.constitution);
  late AbilityController intelligence = AbilityController(update: (){character.intelligence = intelligence.scoreController.text;}, initialScore: character.intelligence);
  late AbilityController wisdom = AbilityController(update: (){character.wisdom = wisdom.scoreController.text;}, initialScore: character.wisdom);
  late AbilityController charisma = AbilityController(update: (){character.charisma = charisma.scoreController.text;}, initialScore: character.charisma);

  late SkillController strSave = SkillController(
    initialProficiency: character.strProf, 
    update: (){character.strProf = strSave.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController dexSave = SkillController(
    initialProficiency: character.dexProf, 
    update: (){character.dexProf = dexSave.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController conSave = SkillController(
    initialProficiency: character.conProf, 
    update: (){character.conProf = conSave.isProficient.value;}, 
    abilityModController: constitution.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController intSave = SkillController(
    initialProficiency: character.intProf, 
    update: (){character.intProf = intSave.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController wisSave = SkillController(
    initialProficiency: character.wisProf, 
    update: (){character.wisProf = wisSave.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController chaSave = SkillController(
    initialProficiency: character.chaProf, 
    update: (){character.chaProf = chaSave.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController);

  late SkillController acrobatics = SkillController(
    initialProficiency: character.acrobaticsProf, 
    update: (){character.acrobaticsProf = acrobatics.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController animalHandling = SkillController(
    initialProficiency: character.animalHandlingProf, 
    update: (){character.animalHandlingProf = animalHandling.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController arcana = SkillController(
    initialProficiency: character.arcanaProf, 
    update: (){character.arcanaProf = arcana.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController athletics  = SkillController(
    initialProficiency: character.athleticsProf, 
    update: (){character.athleticsProf = athletics.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController deception  = SkillController(
    initialProficiency: character.deceptionProf, 
    update: (){character.deceptionProf = deception.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController history  = SkillController(
    initialProficiency: character.historyProf, 
    update: (){character.historyProf = history.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController insight  = SkillController(
    initialProficiency: character.insightProf, 
    update: (){character.insightProf = insight.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController intimidation  = SkillController(
    initialProficiency: character.intimidationProf, 
    update: (){character.intimidationProf = intimidation.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController investigation  = SkillController(
    initialProficiency: character.investigationProf, 
    update: (){character.investigationProf = investigation.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController medicine  = SkillController(
    initialProficiency: character.medicineProf, 
    update: (){character.medicineProf = medicine.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController nature  = SkillController(
    initialProficiency: character.natureProf, 
    update: (){character.natureProf = nature.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController perception  = SkillController(
    initialProficiency: character.perceptionProf, 
    update: (){character.perceptionProf = perception.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController performance  = SkillController(
    initialProficiency: character.performanceProf, 
    update: (){character.performanceProf = performance.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController persuasion  = SkillController(
    initialProficiency: character.persuasionProf, 
    update: (){character.persuasionProf = persuasion.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController religion  = SkillController(
    initialProficiency: character.religionProf, 
    update: (){character.religionProf = religion.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController sleightOfHand  = SkillController(
    initialProficiency: character.sleightOfHandProf, 
    update: (){character.sleightOfHandProf = sleightOfHand.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController stealth  = SkillController(
    initialProficiency: character.stealthProf, 
    update: (){character.stealthProf = stealth.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController);
  late SkillController survival = SkillController(
    initialProficiency: character.survivalProf, 
    update: (){character.survivalProf = survival.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController);


  late final TextEditingController proficiencyBonusController = TextEditingController(text: character.proficiencyBonus);
  late final TextEditingController passivePerceptionController = TextEditingController(text: character.passivePerception);
  late final TextEditingController inspirationController = TextEditingController(text: character.inspiration);

  late final TextEditingController acController = TextEditingController(text: character.armorClass);
  late final TextEditingController initiativeController = TextEditingController(text: character.initiative);
  late final TextEditingController speedController = TextEditingController(text: character.speed);

  late final TextEditingController hpMaxController = TextEditingController(text: character.hpMax);
  late final TextEditingController hpCurrController = TextEditingController(text: character.hpCurr);
  late final TextEditingController hpTempController = TextEditingController(text: character.hpTemp);

  late final TextEditingController hitDiceTotalController = TextEditingController(text: character.hitDiceTotal);
  late final TextEditingController hitDiceCurrController = TextEditingController(text: character.hitDiceCurr);

  late final TextEditingController cpController = TextEditingController(text: character.cp);
  late final TextEditingController spController = TextEditingController(text: character.sp);
  late final TextEditingController epController = TextEditingController(text: character.ep);
  late final TextEditingController gpController = TextEditingController(text: character.gp);
  late final TextEditingController ppController = TextEditingController(text: character.pp);
  late final TextEditingController inventoryController = TextEditingController(text: character.inventory);

  late final TextEditingController proficienciesController = TextEditingController(text: character.proficiencies);
  late final TextEditingController featuresTraitsController = TextEditingController(text: character.featuresTraits);

  late final TextEditingController spellcastingClassController = TextEditingController(text: character.spellcastingClass);
  late final TextEditingController spellcastingAbilityController = TextEditingController(text: character.spellcastingAbility);
  late final TextEditingController spellSaveDCController = TextEditingController(text: character.spellSaveDC);
  late final TextEditingController spellAttackBonusController = TextEditingController(text: character.spellAttackBonus);

  late final TextEditingController backstoryController = TextEditingController(text: character.backstory);
  late final TextEditingController ageController = TextEditingController(text: character.age);
  late final TextEditingController heightController = TextEditingController(text: character.height);
  late final TextEditingController weightController = TextEditingController(text: character.weight);
  late final TextEditingController eyesController = TextEditingController(text: character.eyes);
  late final TextEditingController skinController = TextEditingController(text: character.skin);
  late final TextEditingController hairController = TextEditingController(text: character.hair);
  late final TextEditingController personalityTraitsController = TextEditingController(text: character.personalityTraits);
  late final TextEditingController idealsController = TextEditingController(text: character.ideals);
  late final TextEditingController bondsController = TextEditingController(text: character.bonds);
  late final TextEditingController flawsController = TextEditingController(text: character.flaws);

  late final TextEditingController sessionNotesController = TextEditingController(text: character.sessionNotes);


  CharacterController({
    required this.character
  }) {
    
  }

}



class AbilityController {
  final scoreController = TextEditingController();
  final modifierController = TextEditingController();
  final VoidCallback update;
  final String initialScore;

  AbilityController({
    required this.update,
    required this.initialScore
  }){
    scoreController.text = initialScore;
    scoreController.addListener(_updateAbilityModifier);
  }

  void _updateAbilityModifier() {
    final score = int.tryParse(scoreController.text);
    if (score != null) {
      final mod = ((score - 10) / 2).floor();
      modifierController.text = mod < 0 ? mod.toString() : "+${mod.toString()}";
      update();
    } else {
      modifierController.text = "";
    }
  }
}



class SkillController {
  final skillController = TextEditingController();
  final bool initialProficiency;
  ValueNotifier<bool> isProficient = ValueNotifier<bool>(false);
  final TextEditingController abilityModController;
  final TextEditingController proficiencyController;
  final VoidCallback update;

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
  }
}