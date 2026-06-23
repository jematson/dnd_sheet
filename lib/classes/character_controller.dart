import './classes.dart';


class CharacterController {
  final DNDCharacter c;

  late ValueController name = ValueController(initialValue: c.name, update: (v){c.name = v.valueController.text;});
  late ValueController level = ValueController(initialValue: c.level, update: (v){c.level = v.valueController.text;});
  late ValueController className = ValueController(initialValue: c.className, update: (v){c.className = v.valueController.text;});
  late ValueController race = ValueController(initialValue: c.race, update: (v){c.race = v.valueController.text;});
  late ValueController alignment = ValueController(initialValue: c.alignment, update: (v){c.alignment = v.valueController.text;});
  late ValueController background = ValueController(initialValue: c.background, update: (v){c.background = v.valueController.text;});

  late AbilityController strength = AbilityController(update: (ability){c.strength = ability.scoreController.text;}, initialScore: c.strength);
  late AbilityController dexterity = AbilityController(update: (ability){c.dexterity = ability.scoreController.text;}, initialScore: c.dexterity);
  late AbilityController constitution = AbilityController(update: (ability){c.constitution = ability.scoreController.text;}, initialScore: c.constitution);
  late AbilityController intelligence = AbilityController(update: (ability){c.intelligence = ability.scoreController.text;}, initialScore: c.intelligence);
  late AbilityController wisdom = AbilityController(update: (ability){c.wisdom = ability.scoreController.text;}, initialScore: c.wisdom);
  late AbilityController charisma = AbilityController(update: (ability){c.charisma = ability.scoreController.text;}, initialScore: c.charisma);

  late SkillController strSave = SkillController(
    initialProficiency: c.strProf, 
    update: (skill){c.strProf = skill.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController dexSave = SkillController(
    initialProficiency: c.dexProf, 
    update: (skill){c.dexProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController conSave = SkillController(
    initialProficiency: c.conProf, 
    update: (skill){c.conProf = skill.isProficient.value;}, 
    abilityModController: constitution.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController intSave = SkillController(
    initialProficiency: c.intProf, 
    update: (skill){c.intProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController wisSave = SkillController(
    initialProficiency: c.wisProf, 
    update: (skill){c.wisProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController chaSave = SkillController(
    initialProficiency: c.chaProf, 
    update: (skill){c.chaProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);

  late SkillController acrobatics = SkillController(
    initialProficiency: c.acrobaticsProf, 
    update: (skill){c.acrobaticsProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController animalHandling = SkillController(
    initialProficiency: c.animalHandlingProf, 
    update: (skill){c.animalHandlingProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController arcana = SkillController(
    initialProficiency: c.arcanaProf, 
    update: (skill){c.arcanaProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController athletics  = SkillController(
    initialProficiency: c.athleticsProf, 
    update: (skill){c.athleticsProf = skill.isProficient.value;}, 
    abilityModController: strength.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController deception  = SkillController(
    initialProficiency: c.deceptionProf, 
    update: (skill){c.deceptionProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController history  = SkillController(
    initialProficiency: c.historyProf, 
    update: (skill){c.historyProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController insight  = SkillController(
    initialProficiency: c.insightProf, 
    update: (skill){c.insightProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController intimidation  = SkillController(
    initialProficiency: c.intimidationProf, 
    update: (skill){c.intimidationProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController investigation  = SkillController(
    initialProficiency: c.investigationProf, 
    update: (skill){c.investigationProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController medicine  = SkillController(
    initialProficiency: c.medicineProf, 
    update: (skill){c.medicineProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController nature  = SkillController(
    initialProficiency: c.natureProf, 
    update: (skill){c.natureProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController perception  = SkillController(
    initialProficiency: c.perceptionProf, 
    update: (skill){c.perceptionProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController performance  = SkillController(
    initialProficiency: c.performanceProf, 
    update: (skill){c.performanceProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController persuasion  = SkillController(
    initialProficiency: c.persuasionProf, 
    update: (skill){c.persuasionProf = skill.isProficient.value;}, 
    abilityModController: charisma.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController religion  = SkillController(
    initialProficiency: c.religionProf, 
    update: (skill){c.religionProf = skill.isProficient.value;}, 
    abilityModController: intelligence.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController sleightOfHand  = SkillController(
    initialProficiency: c.sleightOfHandProf, 
    update: (skill){c.sleightOfHandProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController stealth  = SkillController(
    initialProficiency: c.stealthProf, 
    update: (skill){c.stealthProf = skill.isProficient.value;}, 
    abilityModController: dexterity.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);
  late SkillController survival = SkillController(
    initialProficiency: c.survivalProf, 
    update: (skill){c.survivalProf = skill.isProficient.value;}, 
    abilityModController: wisdom.modifierController, 
    proficiencyController: proficiencyBonus.profBonusController);


  late final ProficiencyController proficiencyBonus = ProficiencyController(
    levelController: level.valueController, 
    initialValue: c.proficiencyBonus, 
    update: (prof){c.proficiencyBonus = prof.profBonusController.text;});
  late ValueController passivePerception = ValueController(initialValue: c.passivePerception, update: (v){c.passivePerception = v.valueController.text;});
  late ValueController inspiration = ValueController(initialValue: c.inspiration, update: (v){c.inspiration = v.valueController.text;});

  late ValueController ac = ValueController(initialValue: c.armorClass, update: (v){c.armorClass = v.valueController.text;});
  late ValueController initiative = ValueController(initialValue: c.initiative, update: (v){c.initiative = v.valueController.text;});
  late ValueController speed = ValueController(initialValue: c.speed, update: (v){c.speed = v.valueController.text;});

  late ValueController hpMax = ValueController(initialValue: c.hpMax, update: (v){c.hpMax = v.valueController.text;});
  late ValueController hpCurr = ValueController(initialValue: c.hpCurr, update: (v){c.hpCurr = v.valueController.text;});
  late ValueController hpTemp = ValueController(initialValue: c.hpTemp, update: (v){c.hpTemp = v.valueController.text;});

  late DeathSavesController savesController = DeathSavesController(
    initialS1: c.success1, initialS2: c.success2, initialS3: c.success3, 
    initialF1: c.failure1, initialF2: c.failure2, initialF3: c.failure3, 
    update: (d){c.success1 = d.s1.value; c.success2 = d.s2.value; c.success3 = d.s3.value;
                c.failure1 = d.f1.value; c.failure2 = d.f2.value; c.failure3 = d.f3.value;});

  late ValueController hitDiceTotal = ValueController(initialValue: c.hitDiceTotal, update: (v){c.hitDiceTotal = v.valueController.text;});
  late ValueController hitDiceCurr = ValueController(initialValue: c.hitDiceCurr, update: (v){c.hitDiceCurr = v.valueController.text;});

  late ValueController cp = ValueController(initialValue: c.cp, update: (v){c.cp = v.valueController.text;});
  late ValueController sp = ValueController(initialValue: c.sp, update: (v){c.sp = v.valueController.text;});
  late ValueController ep = ValueController(initialValue: c.ep, update: (v){c.ep = v.valueController.text;});
  late ValueController gp = ValueController(initialValue: c.gp, update: (v){c.gp = v.valueController.text;});
  late ValueController pp = ValueController(initialValue: c.pp, update: (v){c.pp = v.valueController.text;});
  late ValueController inventory = ValueController(initialValue: c.inventory, update: (v){c.inventory = v.valueController.text;});

  late ValueController proficiencies = ValueController(initialValue: c.proficiencies, update: (v){c.proficiencies = v.valueController.text;});
  late ValueController featuresTraits = ValueController(initialValue: c.featuresTraits, update: (v){c.featuresTraits = v.valueController.text;});

  late ValueController spellcastingClass = ValueController(initialValue: c.spellcastingClass, update: (v){c.spellcastingClass = v.valueController.text;});
  late ValueController spellcastingAbility = ValueController(initialValue: c.spellcastingAbility, update: (v){c.spellcastingAbility = v.valueController.text;});
  late ValueController spellSaveDC = ValueController(initialValue: c.spellSaveDC, update: (v){c.spellSaveDC = v.valueController.text;});
  late ValueController spellAttackBonus = ValueController(initialValue: c.spellAttackBonus, update: (v){c.spellAttackBonus = v.valueController.text;});

  late SpellSectionController cantrips = SpellSectionController(
    initialSpellSection: c.cantrips, 
    update: (s){c.cantrips.spells = s.spellsController.value;
                c.cantrips.slotsExpended = s.slotsExpendedController.text;
                c.cantrips.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells1 = SpellSectionController(
    initialSpellSection: c.spells1, 
    update: (s){c.spells1.spells = s.spellsController.value;
                c.spells1.slotsExpended = s.slotsExpendedController.text;
                c.spells1.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells2 = SpellSectionController(
    initialSpellSection: c.spells2, 
    update: (s){c.spells2.spells = s.spellsController.value;
                c.spells2.slotsExpended = s.slotsExpendedController.text;
                c.spells2.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells3 = SpellSectionController(
    initialSpellSection: c.spells3, 
    update: (s){c.spells3.spells = s.spellsController.value;
                c.spells3.slotsExpended = s.slotsExpendedController.text;
                c.spells3.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells4 = SpellSectionController(
    initialSpellSection: c.spells4, 
    update: (s){c.spells4.spells = s.spellsController.value;
                c.spells4.slotsExpended = s.slotsExpendedController.text;
                c.spells4.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells5 = SpellSectionController(
    initialSpellSection: c.spells5, 
    update: (s){c.spells5.spells = s.spellsController.value;
                c.spells5.slotsExpended = s.slotsExpendedController.text;
                c.spells5.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells6 = SpellSectionController(
    initialSpellSection: c.spells6, 
    update: (s){c.spells6.spells = s.spellsController.value;
                c.spells6.slotsExpended = s.slotsExpendedController.text;
                c.spells6.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells7 = SpellSectionController(
    initialSpellSection: c.spells7, 
    update: (s){c.spells7.spells = s.spellsController.value;
                c.spells7.slotsExpended = s.slotsExpendedController.text;
                c.spells7.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells8 = SpellSectionController(
    initialSpellSection: c.spells8, 
    update: (s){c.spells8.spells = s.spellsController.value;
                c.spells8.slotsExpended = s.slotsExpendedController.text;
                c.spells8.slotsTotal = s.slotsTotalController.text;});
  late SpellSectionController spells9 = SpellSectionController(
    initialSpellSection: c.spells9, 
    update: (s){c.spells9.spells = s.spellsController.value;
                c.spells9.slotsExpended = s.slotsExpendedController.text;
                c.spells9.slotsTotal = s.slotsTotalController.text;});

  late ValueController backstory = ValueController(initialValue: c.backstory, update: (v){c.backstory = v.valueController.text;});
  late ValueController age = ValueController(initialValue: c.age, update: (v){c.age = v.valueController.text;});
  late ValueController height = ValueController(initialValue: c.height, update: (v){c.height = v.valueController.text;});
  late ValueController weight = ValueController(initialValue: c.weight, update: (v){c.weight = v.valueController.text;});
  late ValueController eyes = ValueController(initialValue: c.eyes, update: (v){c.eyes = v.valueController.text;});
  late ValueController skin = ValueController(initialValue: c.skin, update: (v){c.skin = v.valueController.text;});
  late ValueController hair = ValueController(initialValue: c.hair, update: (v){c.hair = v.valueController.text;});
  late ValueController personalityTraits = ValueController(initialValue: c.personalityTraits, update: (v){c.personalityTraits = v.valueController.text;});
  late ValueController ideals = ValueController(initialValue: c.ideals, update: (v){c.ideals = v.valueController.text;});
  late ValueController bonds = ValueController(initialValue: c.bonds, update: (v){c.bonds = v.valueController.text;});
  late ValueController flaws = ValueController(initialValue: c.flaws, update: (v){c.flaws = v.valueController.text;});

  late ValueController sessionNotes = ValueController(initialValue: c.sessionNotes, update: (v){c.sessionNotes = v.valueController.text;});


  CharacterController({
    required this.c
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