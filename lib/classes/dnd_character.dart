import './classes.dart';

class DNDCharacter {
  String name;
  String className;
  String level;
  String race;
  String background;
  String alignment;

  String inspiration;
  String proficiencyBonus;
  String passivePerception;

  // Ability Scores
  String strength;
  String strMod;
  String dexterity;
  String dexMod;
  String constitution;
  String conMod;
  String intelligence;
  String intMod;
  String wisdom;
  String wisMod;
  String charisma;
  String chaMod;

  // Saving Throws
  bool strProf;
  bool dexProf;
  bool conProf;
  bool intProf;
  bool wisProf;
  bool chaProf;

  // Skills
  bool acrobaticsProf;
  bool animalHandlingProf;
  bool arcanaProf;
  bool athleticsProf;
  bool deceptionProf;
  bool historyProf;
  bool insightProf;
  bool intimidationProf;
  bool investigationProf;
  bool medicineProf;
  bool natureProf;
  bool perceptionProf;
  bool performanceProf;
  bool persuasionProf;
  bool religionProf;
  bool sleightOfHandProf;
  bool stealthProf;
  bool survivalProf;

  String armorClass;
  String initiative;
  String speed;

  // Hit Points
  String hpMax;
  String hpCurr;
  String hpTemp;

  // Death Saves
  bool success1;
  bool success2;
  bool success3;
  bool failure1;
  bool failure2;
  bool failure3;


  // Character Flavor
  String personalityTraits;
  String ideals;
  String bonds;
  String flaws;
  String age;
  String height;
  String weight;
  String eyes;
  String skin;
  String hair;


  // Equipment
  String cp;
  String sp;
  String ep;
  String gp;
  String pp;
  String equipment;


  // Spellcasting
  String spellcastingClass;
  String spellcastingAbility;
  String spellSaveDC;
  String spellAttackBonus;

  List<Spell> cantrips;
  List <Spell> spells1;
  List <Spell> spells2;
  List <Spell> spells3;
  List <Spell> spells4;
  List <Spell> spells5;
  List <Spell> spells6;
  List <Spell> spells7;
  List <Spell> spells8;
  List <Spell> spells9;

  DNDCharacter({
    this.name = "",
    this.className = "",
    this.level = "",
    this.race = "",
    this.background = "",
    this.alignment = "",
    this.inspiration = "",
    this.proficiencyBonus = "",
    this.passivePerception = "",
    this.strength = "",
    this.strMod = "",
    this.dexterity = "",
    this.dexMod = "",
    this.constitution = "",
    this.conMod = "",
    this.intelligence = "",
    this.intMod = "",
    this.wisdom = "",
    this.wisMod = "",
    this.charisma = "",
    this.chaMod = "",
    this.strProf = false,
    this.dexProf = false,
    this.conProf = false,
    this.intProf = false,
    this.wisProf = false,
    this.chaProf = false,
    this.acrobaticsProf = false,
    this.animalHandlingProf = false,
    this.arcanaProf = false,
    this.athleticsProf = false,
    this.deceptionProf = false,
    this.historyProf = false,
    this.insightProf = false,
    this.intimidationProf = false,
    this.investigationProf = false,
    this.medicineProf = false,
    this.natureProf = false,
    this.perceptionProf = false,
    this.performanceProf = false,
    this.persuasionProf = false,
    this.religionProf = false,
    this.sleightOfHandProf = false,
    this.stealthProf = false,
    this.survivalProf = false,
    this.armorClass = "",
    this.initiative = "",
    this.speed = "",
    this.hpCurr = "",
    this.hpMax = "",
    this.hpTemp = "",
    this.success1 = false,
    this.success2 = false,
    this.success3 = false,
    this.failure1 = false,
    this.failure2 = false,
    this.failure3 = false,
    this.personalityTraits = "",
    this.ideals = "",
    this.bonds = "",
    this.flaws = "",
    this.age = "",
    this.height = "",
    this.weight = "",
    this.eyes = "",
    this.skin = "",
    this.hair = "",
    this.cp = "",
    this.sp = "",
    this.ep = "",
    this.gp = "",
    this.pp = "",
    this.equipment = "",
    this.spellAttackBonus = "",
    this.spellSaveDC = "",
    this.spellcastingAbility = "",
    this.spellcastingClass = "",
    this.cantrips = const [],
    this.spells1 = const [],
    this.spells2 = const [],
    this.spells3 = const [],
    this.spells4 = const [],
    this.spells5 = const [],
    this.spells6 = const [],
    this.spells7 = const [],
    this.spells8 = const [],
    this.spells9 = const [],
  });
}