import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/widgets.dart';
import 'classes/classes.dart';

class CharacterPage extends StatefulWidget {
  final DNDCharacter character;
  final CharacterManager manager;

  const CharacterPage({
    super.key,
    required this.character,
    required this.manager,
  });

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late DNDCharacter character;
  late CharacterController cc;
  late CharacterManager manager;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    manager = widget.manager;
    character = widget.character;
    cc = CharacterController(original: character);
  }


  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.keyS, LogicalKeyboardKey.control): const SaveIntent(),
      },
      child: Actions(
        actions: {
          SaveIntent: CallbackAction<SaveIntent>(onInvoke: (intent) async {
            setState(() {
              _isSaving = true;
            });
            await manager.saveCharacter(cc.c.value);
            cc.original = cc.c.value.copy();
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {
              _isSaving = false;
            });
            return null;
          }),
        },
        child: FocusScope(
          child: Column(
            children: [
              // Fixed Header
              CardSection(
                child: Row(
                  spacing: 20,
                  crossAxisAlignment: .end,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 5,
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: FloatingActionButton(
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    Navigator.pop(context, cc.c.value.copy());
                                  },
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
          
                              ValueListenableBuilder(
                                valueListenable: cc.c, 
                                builder: (_, char, _) {
                                  return _isSaving 
                                  ? SizedBox(height: 25, width: 25, child: CircularProgressIndicator())
                                  :
                                  char.toJson().toString() == cc.original.toJson().toString()
                                    ?
                                    SizedBox(
                                      height: 30,
                                      child: Row(
                                        spacing: 5,
                                        children: [
                                          Icon(Icons.circle, color: Colors.green),
                                          Text("Saved")
                                        ],
                                      ),
                                    )
                                    :
                                    SizedBox(
                                      height: 30,
                                      child: Row(
                                        spacing: 5,
                                        children: [
                                          Icon(Icons.circle, color: Colors.orange),
                                          TextButton(
                                            child: Text("Save Changes"),
                                            onPressed: () async {
                                              setState(() {
                                                _isSaving = true;
                                              });
                                              await manager.saveCharacter(cc.c.value);
                                              cc.original = cc.c.value.copy();
                                              await Future.delayed(Duration(milliseconds: 500));
                                              setState(() {
                                                _isSaving = false;
                                              });
                                            }
                                          ),
                                        ],
                                      ),
                                    );
                                }
                              )
                            ]
                          ),
                          LabeledField(label: "CHARACTER NAME", position: .bottom, size: 22, controller: cc.name.valueController),
                        ],
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              LabeledField.square(label: "LEVEL", position: .bottom, align: .center, controller: cc.level.valueController),
                              Expanded(
                                child: LabeledField(label: "CLASS", position: .bottom, controller: cc.className.valueController)
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: LabeledField(label: "RACE", position: .bottom, controller: cc.race.valueController)
                              ),
                              Expanded(
                                child: LabeledField(label: "ALIGNMENT", position: .bottom, controller: cc.alignment.valueController)
                              ),
                              Expanded(
                                child: LabeledField(label: "BACKGROUND", position: .bottom, controller: cc.background.valueController)
                              ),
                            ],
                          )
                        ]
                      )
                    )
                  ],
                )
              ),
          
          
              // Scrollable Main
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
          
                        Row( 
                          crossAxisAlignment: .start,        // First page 3 columns
                          children: [
                    
                            // First Column
                            SizedBox(
                              width: 275,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          spacing: 15,
                                          children: [
                                            AbilityBox(value: "STR", controller: cc.strength.scoreController, modController: cc.strength.modifierController),
                                            AbilityBox(value: "DEX", controller: cc.dexterity.scoreController, modController: cc.dexterity.modifierController),
                                            AbilityBox(value: "CON", controller: cc.constitution.scoreController, modController: cc.constitution.modifierController),
                                            AbilityBox(value: "INT", controller: cc.intelligence.scoreController, modController: cc.intelligence.modifierController),
                                            AbilityBox(value: "WIS", controller: cc.wisdom.scoreController, modController: cc.wisdom.modifierController),
                                            AbilityBox(value: "CHA", controller: cc.charisma.scoreController, modController: cc.charisma.modifierController),
                                          ]
                                        )
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            CardSection(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "SAVING THROWS", 
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: .bold
                                                    )
                                                  ),
                                                  SkillLine(value: "Strength", skill: cc.strSave),
                                                  SkillLine(value: "Dexterity", skill: cc.dexSave),
                                                  SkillLine(value: "Constitution", skill: cc.conSave),
                                                  SkillLine(value: "Intelligence", skill: cc.intSave),
                                                  SkillLine(value: "Wisdom", skill: cc.wisSave),
                                                  SkillLine(value: "Charisma", skill: cc.chaSave),
                                                ]
                                              )
                                            ),
                                            CardSection(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "SKILLS", 
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: .bold
                                                    )
                                                  ),
                                                  SkillLine(value: "Acrobatics (dex)", skill: cc.acrobatics),
                                                  SkillLine(value: "Animal Handling (wis)", skill: cc.animalHandling),
                                                  SkillLine(value: "Arcana (int)", skill: cc.arcana),
                                                  SkillLine(value: "Athletics (str)", skill: cc.athletics),
                                                  SkillLine(value: "Deception (cha)", skill: cc.deception),
                                                  SkillLine(value: "History (int)", skill: cc.history),
                                                  SkillLine(value: "Insight (wis)", skill: cc.insight),
                                                  SkillLine(value: "Intimidation (cha)", skill: cc.intimidation),
                                                  SkillLine(value: "Investigation (int)", skill: cc.investigation),
                                                  SkillLine(value: "Medicine (wis)", skill: cc.medicine),
                                                  SkillLine(value: "Nature (wis)", skill: cc.nature),
                                                  SkillLine(value: "Perception (wis)", skill: cc.perception),
                                                  SkillLine(value: "Performance (cha)", skill: cc.performance),
                                                  SkillLine(value: "Persuasion (cha)", skill: cc.persuasion),
                                                  SkillLine(value: "Religion (int)", skill: cc.religion),
                                                  SkillLine(value: "Sleight of Hand (dex)", skill: cc.sleightOfHand),
                                                  SkillLine(value: "Stealth (dex)", skill: cc.stealth),
                                                  SkillLine(value: "Survival (wis)", skill: cc.survival),
                                                ]
                                              )
                                            ),
                                          ]
                                        )
                                      ),
                                    ]
                                  ),
          
                                  ValueBox(label: "PROFICIENCIES & LANGUAGES", position: .bottom, multiline: true, maxLines: 4, controller: cc.proficiencies.valueController)
                                ]
                              )
                            ),
                    
                            // Second Column
                            Expanded(
                              child: Column(
                                mainAxisAlignment: .start,
                                children: [
                                  Row(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Expanded(child: ValueBox(label: "AC", position: .bottom, align: .center, controller: cc.ac.valueController)),
                                      Expanded(child: ValueBox(label: "INITIATIVE", position: .bottom, align: .center, controller: cc.initiative.valueController)),
                                      Expanded(child: ValueBox(label: "SPEED", position: .bottom, align: .center, controller: cc.speed.valueController)),
                                    ],
                                  ),
                                  CardSection(
                                    child: Column(
                                      spacing: 5,
                                      children: [
                                        Text("HIT POINTS"),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Expanded(
                                              child: LabeledField(label: "MAX", position: .bottom, align: .center, controller: cc.hpMax.valueController)
                                            ),
                                            Expanded(
                                              child: LabeledField(label: "CURRENT", position: .bottom, align: .center, controller: cc.hpCurr.valueController)
                                            ),
                                            Expanded(
                                              child: LabeledField(label: "TEMP", position: .bottom, align: .center, controller: cc.hpTemp.valueController)
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
          
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CardSection(
                                          child: Column(
                                            spacing: 5,
                                            children: [
                                              LabeledField(label: "TOTAL", position: .left, size: 10, controller: cc.hitDiceTotal.valueController),
                                              LabeledField(label: "HIT DICE", position: .bottom, size: 14, align: .center, controller: cc.hitDiceCurr.valueController)
                                            ]
                                          )
                                        ),
                                      ),
                                      SavesBox(saves: cc.savesController),
                                    ],
                                  ),
          
                                  CardSection(
                                    child: AttackSection(attacksController: cc.attackSection)
                                  ),
          
                                  CardSection(
                                    child: Column(
                                      spacing: 10,
                                      children: [
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Expanded(child: LabeledField(label: "CP", position: .top, size: 12, align: .center, controller: cc.cp.valueController)),
                                            Expanded(child: LabeledField(label: "SP", position: .top, size: 12, align: .center, controller: cc.sp.valueController)),
                                            Expanded(child: LabeledField(label: "EP", position: .top, size: 12, align: .center, controller: cc.ep.valueController)),
                                            Expanded(child: LabeledField(label: "GP", position: .top, size: 12, align: .center, controller: cc.gp.valueController)),
                                            Expanded(child: LabeledField(label: "PP", position: .top, size: 12, align: .center, controller: cc.pp.valueController)),
                                          ]
                                        ),
                                        LabeledField(label: "INVENTORY", position: .bottom, multiline: true, maxLines: 24, controller: cc.inventory.valueController)
                                      ],
                                    )
                                  ),
          
          
                                ]
                              )
                            ),
                    
                            // Third Column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  ValueBox.square(label: "INSPIRATION", position: .right, controller: cc.inspiration.valueController),
                                  ValueBox.square(label: "PROFICIENCY BONUS", position: .right, controller: cc.proficiencyBonus.profBonusController),
                                  ValueBox.square(label: "PASSIVE PERCEPTION", position: .right, controller: cc.passivePerception.valueController),
                                  ValueBox(label: "FEATURES & TRAITS", position: .bottom, multiline: true, maxLines: 30, controller: cc.featuresTraits.valueController),
                                ]
                              )
                            )
                          
                          ]
                        ),
                    
          
                        Row(      // Spellcasting Header
                          children: [
                            Expanded(
                              child: ValueBox(label: "SPELLCASTING CLASS", position: .bottom, controller: cc.spellcastingClass.valueController)
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ValueBox(label: "SPELLCASTING ABILITY", position: .bottom, controller: cc.spellcastingAbility.valueController)
                                  ),
                                  Expanded(
                                    child: ValueBox(label: "SPELL SAVE DC", position: .bottom, controller: cc.spellSaveDC.valueController)
                                  ),
                                  Expanded(
                                    child: ValueBox(label: "SPELL ATTACK BONUS", position: .bottom, controller: cc.spellAttackBonus.valueController)
                                  ),
                                ],
                              ),
                            )
                          ]
                        ),
          
                        // Spellcasting Columns
                        Row(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SpellSection(level: .cantrip, spells: cc.cantrips),
                                  SpellSection(level: .one, spells: cc.spells1),
                                  SpellSection(level: .two, spells: cc.spells2),
                                ]
                              )
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SpellSection(level: .three, spells: cc.spells3),
                                  SpellSection(level: .four, spells: cc.spells4),
                                  SpellSection(level: .five, spells: cc.spells5),
                                ]
                              )
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SpellSection(level: .six, spells: cc.spells6),
                                  SpellSection(level: .seven, spells: cc.spells7),
                                  SpellSection(level: .eight, spells: cc.spells8),
                                  SpellSection(level: .nine, spells: cc.spells9)
                                ]
                              )
                            )
                          ]
                        ),
                    
                        // Character Info Section
                        Row(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ValueBox(label: "BACKSTORY", position: .top, multiline: true, maxLines: 19, controller: cc.backstory.valueController)
                                ]
                              ),
                            ),
          
                            Expanded(
                              child: Column(
                                children: [
                                  CardSection(
                                    child: Column(
                                      children: [
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Expanded(child: LabeledField(label: "AGE", position: .bottom, controller: cc.age.valueController)),
                                            Expanded(child: LabeledField(label: "HEIGHT", position: .bottom, controller: cc.height.valueController)),
                                            Expanded(child: LabeledField(label: "WEIGHT", position: .bottom, controller: cc.weight.valueController)),
                                          ]
                                        ),
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Expanded(child: LabeledField(label: "EYES", position: .bottom, controller: cc.eyes.valueController)),
                                            Expanded(child: LabeledField(label: "SKIN", position: .bottom, controller: cc.skin.valueController)),
                                            Expanded(child: LabeledField(label: "HAIR", position: .bottom, controller: cc.hair.valueController)),
                                          ]
                                        ),
                                      ]
                                    )
                                  ),
                                  ValueBox(label: "PERSONALITY TRAITS", position: .bottom, multiline: true, controller: cc.personalityTraits.valueController),
                                  ValueBox(label: "IDEALS", position: .bottom, multiline: true, controller: cc.ideals.valueController),
                                  ValueBox(label: "BONDS", position: .bottom, multiline: true, controller: cc.bonds.valueController),
                                  ValueBox(label: "FLAWS", position: .bottom, multiline: true, controller: cc.flaws.valueController),
                                ]
                              ),
                            ),
          
                          ]
                        ),
          
                        ValueBox(label: "SESSION NOTES", position: .top, multiline: true, maxLines: 4, controller: cc.sessionNotes.valueController)
          
                        // END OF CHARACTER SHEET
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cc.dispose();
    super.dispose();
  }
}

class SaveIntent extends Intent {
  const SaveIntent();
}