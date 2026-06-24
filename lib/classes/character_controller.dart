import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/change_notifier.dart';
import './classes.dart';


class CharacterController {
  DNDCharacter original;
  final ValueNotifier<DNDCharacter> c;

  late ValueController name = ValueController(initialValue: c.value.name, update: (v){c.value.name = v.valueController.text; c.notifyListeners();});
  late ValueController level = ValueController(initialValue: c.value.level, update: (v){c.value.level = v.valueController.text; c.notifyListeners();});
  late ValueController className = ValueController(initialValue: c.value.className, update: (v){c.value.className = v.valueController.text; c.notifyListeners();});
  late ValueController race = ValueController(initialValue: c.value.race, update: (v){c.value.race = v.valueController.text; c.notifyListeners();});
  late ValueController alignment = ValueController(initialValue: c.value.alignment, update: (v){c.value.alignment = v.valueController.text; c.notifyListeners();});
  late ValueController background = ValueController(initialValue: c.value.background, update: (v){c.value.background = v.valueController.text; c.notifyListeners();});

  late AbilityController strength = AbilityController(update: (ability){c.value.strength = ability.scoreController.text; c.notifyListeners();}, initialScore: c.value.strength);
  late AbilityController dexterity = AbilityController(update: (ability){c.value.dexterity = ability.scoreController.text; c.notifyListeners();}, initialScore: c.value.dexterity);
  late AbilityController constitution = AbilityController(update: (ability){c.value.constitution = ability.scoreController.text; c.notifyListeners();}, initialScore: c.value.constitution);
  late AbilityController intelligence = AbilityController(update: (ability){c.value.intelligence = ability.scoreController.text; c.notifyListeners();}, initialScore: c.value.intelligence);
  late AbilityController wisdom = AbilityController(update: (ability){c.value.wisdom = ability.scoreController.text; c.notifyListeners();}, initialScore: c.value.wisdom);
  late AbilityController charisma = AbilityController(update: (ability){c.value.charisma = ability.scoreController.text; c.notifyListeners();}, initialScore: c.value.charisma);

  late SkillController strSave = SkillController(
    initialProficiency: c.value.strProf, 
    update: (skill){c.value.strProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController dexSave = SkillController(
    initialProficiency: c.value.dexProf, 
    update: (skill){c.value.dexProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController conSave = SkillController(
    initialProficiency: c.value.conProf, 
    update: (skill){c.value.conProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: constitution.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController intSave = SkillController(
    initialProficiency: c.value.intProf, 
    update: (skill){c.value.intProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController wisSave = SkillController(
    initialProficiency: c.value.wisProf, 
    update: (skill){c.value.wisProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController chaSave = SkillController(
    initialProficiency: c.value.chaProf, 
    update: (skill){c.value.chaProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);

  late SkillController acrobatics = SkillController(
    initialProficiency: c.value.acrobaticsProf, 
    update: (skill){c.value.acrobaticsProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController animalHandling = SkillController(
    initialProficiency: c.value.animalHandlingProf, 
    update: (skill){c.value.animalHandlingProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController arcana = SkillController(
    initialProficiency: c.value.arcanaProf, 
    update: (skill){c.value.arcanaProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController athletics  = SkillController(
    initialProficiency: c.value.athleticsProf, 
    update: (skill){c.value.athleticsProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController deception  = SkillController(
    initialProficiency: c.value.deceptionProf, 
    update: (skill){c.value.deceptionProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController history  = SkillController(
    initialProficiency: c.value.historyProf, 
    update: (skill){c.value.historyProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController insight  = SkillController(
    initialProficiency: c.value.insightProf, 
    update: (skill){c.value.insightProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController intimidation  = SkillController(
    initialProficiency: c.value.intimidationProf, 
    update: (skill){c.value.intimidationProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController investigation  = SkillController(
    initialProficiency: c.value.investigationProf, 
    update: (skill){c.value.investigationProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController medicine  = SkillController(
    initialProficiency: c.value.medicineProf, 
    update: (skill){c.value.medicineProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController nature  = SkillController(
    initialProficiency: c.value.natureProf, 
    update: (skill){c.value.natureProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController perception  = SkillController(
    initialProficiency: c.value.perceptionProf, 
    update: (skill){c.value.perceptionProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController performance  = SkillController(
    initialProficiency: c.value.performanceProf, 
    update: (skill){c.value.performanceProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController persuasion  = SkillController(
    initialProficiency: c.value.persuasionProf, 
    update: (skill){c.value.persuasionProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController religion  = SkillController(
    initialProficiency: c.value.religionProf, 
    update: (skill){c.value.religionProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController sleightOfHand  = SkillController(
    initialProficiency: c.value.sleightOfHandProf, 
    update: (skill){c.value.sleightOfHandProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController stealth  = SkillController(
    initialProficiency: c.value.stealthProf, 
    update: (skill){c.value.stealthProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController survival = SkillController(
    initialProficiency: c.value.survivalProf, 
    update: (skill){c.value.survivalProf = skill.isProficient.value; c.notifyListeners();}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);


  late final ProficiencyController proficiencyBonus = ProficiencyController(
    levelController: level.valueController, 
    initialValue: c.value.proficiencyBonus, 
    update: (prof){c.value.proficiencyBonus = prof.profBonusController.text; 
                   c.notifyListeners();});
  late ValueController passivePerception = ValueController(initialValue: c.value.passivePerception, update: (v){c.value.passivePerception = v.valueController.text; c.notifyListeners();});
  late ValueController inspiration = ValueController(initialValue: c.value.inspiration, update: (v){c.value.inspiration = v.valueController.text; c.notifyListeners();});

  late ValueController ac = ValueController(initialValue: c.value.armorClass, update: (v){c.value.armorClass = v.valueController.text; c.notifyListeners();});
  late ValueController initiative = ValueController(initialValue: c.value.initiative, update: (v){c.value.initiative = v.valueController.text; c.notifyListeners();});
  late ValueController speed = ValueController(initialValue: c.value.speed, update: (v){c.value.speed = v.valueController.text; c.notifyListeners();});

  late ValueController hpMax = ValueController(initialValue: c.value.hpMax, update: (v){c.value.hpMax = v.valueController.text; c.notifyListeners();});
  late ValueController hpCurr = ValueController(initialValue: c.value.hpCurr, update: (v){c.value.hpCurr = v.valueController.text; c.notifyListeners();});
  late ValueController hpTemp = ValueController(initialValue: c.value.hpTemp, update: (v){c.value.hpTemp = v.valueController.text; c.notifyListeners();});

  late DeathSavesController savesController = DeathSavesController(
    initialS1: c.value.success1, initialS2: c.value.success2, initialS3: c.value.success3, 
    initialF1: c.value.failure1, initialF2: c.value.failure2, initialF3: c.value.failure3, 
    update: (d){c.value.success1 = d.s1.value; c.value.success2 = d.s2.value; c.value.success3 = d.s3.value;
                c.value.failure1 = d.f1.value; c.value.failure2 = d.f2.value; c.value.failure3 = d.f3.value; c.notifyListeners();});

  late ValueController hitDiceTotal = ValueController(initialValue: c.value.hitDiceTotal, update: (v){c.value.hitDiceTotal = v.valueController.text; c.notifyListeners();});
  late ValueController hitDiceCurr = ValueController(initialValue: c.value.hitDiceCurr, update: (v){c.value.hitDiceCurr = v.valueController.text; c.notifyListeners();});

  late AttackSectionController attackSection = AttackSectionController(
    initialAttacks: c.value.attacks,
    update: (a){c.value.attacks = a.attacks.value;
                c.notifyListeners(); c.notifyListeners();});

  late ValueController cp = ValueController(initialValue: c.value.cp, update: (v){c.value.cp = v.valueController.text; c.notifyListeners();});
  late ValueController sp = ValueController(initialValue: c.value.sp, update: (v){c.value.sp = v.valueController.text; c.notifyListeners();});
  late ValueController ep = ValueController(initialValue: c.value.ep, update: (v){c.value.ep = v.valueController.text; c.notifyListeners();});
  late ValueController gp = ValueController(initialValue: c.value.gp, update: (v){c.value.gp = v.valueController.text; c.notifyListeners();});
  late ValueController pp = ValueController(initialValue: c.value.pp, update: (v){c.value.pp = v.valueController.text; c.notifyListeners();});
  late ValueController inventory = ValueController(initialValue: c.value.inventory, update: (v){c.value.inventory = v.valueController.text; c.notifyListeners();});

  late ValueController proficiencies = ValueController(initialValue: c.value.proficiencies, update: (v){c.value.proficiencies = v.valueController.text; c.notifyListeners();});
  late ValueController featuresTraits = ValueController(initialValue: c.value.featuresTraits, update: (v){c.value.featuresTraits = v.valueController.text; c.notifyListeners();});

  late ValueController spellcastingClass = ValueController(initialValue: c.value.spellcastingClass, update: (v){c.value.spellcastingClass = v.valueController.text; c.notifyListeners();});
  late ValueController spellcastingAbility = ValueController(initialValue: c.value.spellcastingAbility, update: (v){c.value.spellcastingAbility = v.valueController.text; c.notifyListeners();});
  late ValueController spellSaveDC = ValueController(initialValue: c.value.spellSaveDC, update: (v){c.value.spellSaveDC = v.valueController.text; c.notifyListeners();});
  late ValueController spellAttackBonus = ValueController(initialValue: c.value.spellAttackBonus, update: (v){c.value.spellAttackBonus = v.valueController.text; c.notifyListeners();});

  late SpellSectionController cantrips = SpellSectionController(
    initialSpellSection: c.value.cantrips, 
    update: (s){c.value.cantrips.spells = s.spellsController.value;
                c.value.cantrips.slotsExpended = s.slotsExpendedController.text;
                c.value.cantrips.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells1 = SpellSectionController(
    initialSpellSection: c.value.spells1, 
    update: (s){c.value.spells1.spells = s.spellsController.value;
                c.value.spells1.slotsExpended = s.slotsExpendedController.text;
                c.value.spells1.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells2 = SpellSectionController(
    initialSpellSection: c.value.spells2, 
    update: (s){c.value.spells2.spells = s.spellsController.value;
                c.value.spells2.slotsExpended = s.slotsExpendedController.text;
                c.value.spells2.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells3 = SpellSectionController(
    initialSpellSection: c.value.spells3, 
    update: (s){c.value.spells3.spells = s.spellsController.value;
                c.value.spells3.slotsExpended = s.slotsExpendedController.text;
                c.value.spells3.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells4 = SpellSectionController(
    initialSpellSection: c.value.spells4, 
    update: (s){c.value.spells4.spells = s.spellsController.value;
                c.value.spells4.slotsExpended = s.slotsExpendedController.text;
                c.value.spells4.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells5 = SpellSectionController(
    initialSpellSection: c.value.spells5, 
    update: (s){c.value.spells5.spells = s.spellsController.value;
                c.value.spells5.slotsExpended = s.slotsExpendedController.text;
                c.value.spells5.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells6 = SpellSectionController(
    initialSpellSection: c.value.spells6, 
    update: (s){c.value.spells6.spells = s.spellsController.value;
                c.value.spells6.slotsExpended = s.slotsExpendedController.text;
                c.value.spells6.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells7 = SpellSectionController(
    initialSpellSection: c.value.spells7, 
    update: (s){c.value.spells7.spells = s.spellsController.value;
                c.value.spells7.slotsExpended = s.slotsExpendedController.text;
                c.value.spells7.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});
  late SpellSectionController spells8 = SpellSectionController(
    initialSpellSection: c.value.spells8, 
    update: (s){c.value.spells8.spells = s.spellsController.value;
                c.value.spells8.slotsExpended = s.slotsExpendedController.text;
                c.value.spells8.slotsTotal = s.slotsTotalController.text;
                c.notifyListeners(); c.notifyListeners();});
  late SpellSectionController spells9 = SpellSectionController(
    initialSpellSection: c.value.spells9, 
    update: (s){c.value.spells9.spells = s.spellsController.value;
                c.value.spells9.slotsExpended = s.slotsExpendedController.text;
                c.value.spells9.slotsTotal = s.slotsTotalController.text; 
                c.notifyListeners();});

  late ValueController backstory = ValueController(initialValue: c.value.backstory, update: (v){c.value.backstory = v.valueController.text; c.notifyListeners();});
  late ValueController age = ValueController(initialValue: c.value.age, update: (v){c.value.age = v.valueController.text; c.notifyListeners();});
  late ValueController height = ValueController(initialValue: c.value.height, update: (v){c.value.height = v.valueController.text; c.notifyListeners();});
  late ValueController weight = ValueController(initialValue: c.value.weight, update: (v){c.value.weight = v.valueController.text; c.notifyListeners();});
  late ValueController eyes = ValueController(initialValue: c.value.eyes, update: (v){c.value.eyes = v.valueController.text; c.notifyListeners();});
  late ValueController skin = ValueController(initialValue: c.value.skin, update: (v){c.value.skin = v.valueController.text; c.notifyListeners();});
  late ValueController hair = ValueController(initialValue: c.value.hair, update: (v){c.value.hair = v.valueController.text; c.notifyListeners();});
  late ValueController personalityTraits = ValueController(initialValue: c.value.personalityTraits, update: (v){c.value.personalityTraits = v.valueController.text; c.notifyListeners();});
  late ValueController ideals = ValueController(initialValue: c.value.ideals, update: (v){c.value.ideals = v.valueController.text; c.notifyListeners();});
  late ValueController bonds = ValueController(initialValue: c.value.bonds, update: (v){c.value.bonds = v.valueController.text; c.notifyListeners();});
  late ValueController flaws = ValueController(initialValue: c.value.flaws, update: (v){c.value.flaws = v.valueController.text; c.notifyListeners();});

  late ValueController sessionNotes = ValueController(initialValue: c.value.sessionNotes, 
  update: (v){c.value.sessionNotes = v.valueController.text;
              c.notifyListeners(); c.notifyListeners();});


  CharacterController({
    required this.original
  }) : c = ValueNotifier(original.copy());

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

    cantrips.dispose();
    spells1.dispose();
    spells2.dispose();
    spells3.dispose();
    spells4.dispose();
    spells5.dispose();
    spells6.dispose();
    spells7.dispose();
    spells8.dispose();
    spells9.dispose();
    
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