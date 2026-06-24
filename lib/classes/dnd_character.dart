import './classes.dart';
import 'package:json_annotation/json_annotation.dart';


part 'dnd_character.g.dart';

@JsonSerializable(explicitToJson: true)
class DNDCharacter {
  String fileID;
  bool archived;

  String name;
  String className;
  String level;
  String race;
  String background;
  String alignment;

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

  String inspiration;
  String proficiencyBonus;
  String passivePerception;

  String proficiencies;
  String featuresTraits;

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

  // Hit Dice
  String hitDiceTotal;
  String hitDiceCurr;

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
  String backstory;

  // Attacks
  List<Attack> attacks;

  // Equipment
  String cp;
  String sp;
  String ep;
  String gp;
  String pp;
  String inventory;


  // Spellcasting
  bool showSpellcasting;
  String spellcastingClass;
  String spellcastingAbility;
  String spellSaveDC;
  String spellAttackBonus;

  late SpellLevelSection cantrips;
  late SpellLevelSection spells1;
  late SpellLevelSection spells2;
  late SpellLevelSection spells3;
  late SpellLevelSection spells4;
  late SpellLevelSection spells5;
  late SpellLevelSection spells6;
  late SpellLevelSection spells7;
  late SpellLevelSection spells8;
  late SpellLevelSection spells9;

  String sessionNotes;

  DNDCharacter({
    required this.fileID,
    this.archived = false,
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
    this.proficiencies = "",
    this.featuresTraits = "",
    this.speed = "",
    this.hpCurr = "",
    this.hpMax = "",
    this.hpTemp = "",
    this.hitDiceCurr = "",
    this.hitDiceTotal = "",
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
    this.backstory = "",
    List<Attack>? attacks,
    this.cp = "",
    this.sp = "",
    this.ep = "",
    this.gp = "",
    this.pp = "",
    this.inventory = "",
    this.showSpellcasting = true,
    this.spellAttackBonus = "",
    this.spellSaveDC = "",
    this.spellcastingAbility = "",
    this.spellcastingClass = "",
    SpellLevelSection? cantrips,
    SpellLevelSection? spells1,
    SpellLevelSection? spells2,
    SpellLevelSection? spells3,
    SpellLevelSection? spells4,
    SpellLevelSection? spells5,
    SpellLevelSection? spells6,
    SpellLevelSection? spells7,
    SpellLevelSection? spells8,
    SpellLevelSection? spells9,
    this.sessionNotes = "",
  }): attacks = attacks ?? [],
      cantrips = cantrips ?? SpellLevelSection(),
      spells1 = spells1 ?? SpellLevelSection(),
      spells2 = spells2 ?? SpellLevelSection(),
      spells3 = spells3 ?? SpellLevelSection(),
      spells4 = spells4 ?? SpellLevelSection(),
      spells5 = spells5 ?? SpellLevelSection(),
      spells6 = spells6 ?? SpellLevelSection(),
      spells7 = spells7 ?? SpellLevelSection(),
      spells8 = spells8 ?? SpellLevelSection(),
      spells9 = spells9 ?? SpellLevelSection();

    
  factory DNDCharacter.fromJson(Map<String, dynamic> json) =>
    _$DNDCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$DNDCharacterToJson(this);

  DNDCharacter copy() {
    return DNDCharacter.fromJson(toJson());
  }
}
