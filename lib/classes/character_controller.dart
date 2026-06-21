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

  late final TextEditingController strengthController = TextEditingController(text: character.strength);
  late final TextEditingController dexterityController = TextEditingController(text: character.dexterity);
  late final TextEditingController constitutionController = TextEditingController(text: character.constitution);
  late final TextEditingController intelligenceController = TextEditingController(text: character.intelligence);
  late final TextEditingController wisdomController = TextEditingController(text: character.wisdom);
  late final TextEditingController charismaController = TextEditingController(text: character.charisma);

  late final TextEditingController strModController = TextEditingController();
  late final TextEditingController dexModController = TextEditingController();
  late final TextEditingController conModController = TextEditingController();
  late final TextEditingController intModController = TextEditingController();
  late final TextEditingController wisModController = TextEditingController();
  late final TextEditingController chaModController = TextEditingController();

  late final TextEditingController strSaveController = TextEditingController();
  late final TextEditingController dexSaveController = TextEditingController();
  late final TextEditingController conSaveController = TextEditingController();
  late final TextEditingController intSaveController = TextEditingController();
  late final TextEditingController wisSaveController = TextEditingController();
  late final TextEditingController chaSaveController = TextEditingController();

  late final TextEditingController acrobaticsController = TextEditingController();
  late final TextEditingController animalHandlingController = TextEditingController();
  late final TextEditingController arcanaController = TextEditingController();
  late final TextEditingController athleticsController = TextEditingController();
  late final TextEditingController deceptionController = TextEditingController();
  late final TextEditingController historyController = TextEditingController();
  late final TextEditingController insightController = TextEditingController();
  late final TextEditingController intimidationController = TextEditingController();
  late final TextEditingController investigationController = TextEditingController();
  late final TextEditingController medicineController = TextEditingController();
  late final TextEditingController natureController = TextEditingController();
  late final TextEditingController perceptionController = TextEditingController();
  late final TextEditingController performanceController = TextEditingController();
  late final TextEditingController persuasionController = TextEditingController();
  late final TextEditingController religionController = TextEditingController();
  late final TextEditingController sleightOfHandController = TextEditingController();
  late final TextEditingController stealthController = TextEditingController();
  late final TextEditingController survivalController = TextEditingController();

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
    nameController.text = character.name;

  }




}