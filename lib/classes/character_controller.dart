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
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController dexSave = SkillController(
    initialProficiency: character.dexProf, 
    update: (skill){character.dexProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController conSave = SkillController(
    initialProficiency: character.conProf, 
    update: (skill){character.conProf = skill.isProficient.value;}, 
    abilityModController: constitution.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController intSave = SkillController(
    initialProficiency: character.intProf, 
    update: (skill){character.intProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController wisSave = SkillController(
    initialProficiency: character.wisProf, 
    update: (skill){character.wisProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController chaSave = SkillController(
    initialProficiency: character.chaProf, 
    update: (skill){character.chaProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);

  late SkillController acrobatics = SkillController(
    initialProficiency: character.acrobaticsProf, 
    update: (skill){character.acrobaticsProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController animalHandling = SkillController(
    initialProficiency: character.animalHandlingProf, 
    update: (skill){character.animalHandlingProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController arcana = SkillController(
    initialProficiency: character.arcanaProf, 
    update: (skill){character.arcanaProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController athletics  = SkillController(
    initialProficiency: character.athleticsProf, 
    update: (skill){character.athleticsProf = skill.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController deception  = SkillController(
    initialProficiency: character.deceptionProf, 
    update: (skill){character.deceptionProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController history  = SkillController(
    initialProficiency: character.historyProf, 
    update: (skill){character.historyProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController insight  = SkillController(
    initialProficiency: character.insightProf, 
    update: (skill){character.insightProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController intimidation  = SkillController(
    initialProficiency: character.intimidationProf, 
    update: (skill){character.intimidationProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController investigation  = SkillController(
    initialProficiency: character.investigationProf, 
    update: (skill){character.investigationProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController medicine  = SkillController(
    initialProficiency: character.medicineProf, 
    update: (skill){character.medicineProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController nature  = SkillController(
    initialProficiency: character.natureProf, 
    update: (skill){character.natureProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController perception  = SkillController(
    initialProficiency: character.perceptionProf, 
    update: (skill){character.perceptionProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController performance  = SkillController(
    initialProficiency: character.performanceProf, 
    update: (skill){character.performanceProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController persuasion  = SkillController(
    initialProficiency: character.persuasionProf, 
    update: (skill){character.persuasionProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController religion  = SkillController(
    initialProficiency: character.religionProf, 
    update: (skill){character.religionProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController sleightOfHand  = SkillController(
    initialProficiency: character.sleightOfHandProf, 
    update: (skill){character.sleightOfHandProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController stealth  = SkillController(
    initialProficiency: character.stealthProf, 
    update: (skill){character.stealthProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);
  late SkillController survival = SkillController(
    initialProficiency: character.survivalProf, 
    update: (skill){character.survivalProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonusController.profBonusController);


  late final ProficiencyController proficiencyBonusController = ProficiencyController(
    levelController: levelController, 
    initialValue: character.proficiencyBonus, 
    update: (prof){character.proficiencyBonus = prof.profBonusController.text;});
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
  });

  void dispose() {
    nameController.dispose();
    levelController.dispose();
    classController.dispose();
    raceController.dispose();
    alignmentController.dispose();
    backgroundController.dispose();

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
    
    proficiencyBonusController.dispose();
    passivePerceptionController.dispose();
    inspirationController.dispose();
    
    acController.dispose();
    initiativeController.dispose();
    speedController.dispose();
    
    hpCurrController.dispose();
    hpMaxController.dispose();
    hpTempController.dispose();
    
    hitDiceCurrController.dispose();
    hitDiceTotalController.dispose();
    
    cpController.dispose();
    spController.dispose();
    epController.dispose();
    gpController.dispose();
    ppController.dispose();
    inventoryController.dispose();
    
    proficienciesController.dispose();
    featuresTraitsController.dispose();
    
    spellcastingAbilityController.dispose();
    spellcastingClassController.dispose();
    spellSaveDCController.dispose();
    spellAttackBonusController.dispose();
    
    backstoryController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    eyesController.dispose();
    skinController.dispose();
    hairController.dispose();
    personalityTraitsController.dispose();
    idealsController.dispose();
    bondsController.dispose();
    flawsController.dispose();
    
    sessionNotesController.dispose();
    
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
  }){
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