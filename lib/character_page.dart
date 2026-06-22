import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import 'classes/classes.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    super.key,
    required this.character,
  });

  final DNDCharacter character;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late DNDCharacter character;
  late DNDCharacter editedCharacter;

  late CharacterController cc;


  @override
  void initState() {
    super.initState();
    character = widget.character;
    editedCharacter = widget.character.copy();
    cc = CharacterController(character: editedCharacter);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Fixed Header
        Card(
          child: Row(
            spacing: 20,
            crossAxisAlignment: .end,
            children: [
              Expanded(
                child: LabeledField(label: "CHARACTER NAME", position: .bottom, size: 22, controller: cc.nameController)
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        LabeledField.square(label: "LEVEL", position: .bottom, align: .center, controller: cc.levelController),
                        Expanded(
                          child: LabeledField(label: "CLASS", position: .bottom, controller: cc.classController)
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: LabeledField(label: "RACE", position: .bottom, controller: cc.raceController)
                        ),
                        Expanded(
                          child: LabeledField(label: "ALIGNMENT", position: .bottom, controller: cc.alignmentController)
                        ),
                        Expanded(
                          child: LabeledField(label: "BACKGROUND", position: .bottom, controller: cc.backgroundController)
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

                            ValueBox(label: "PROFICIENCIES & LANGUAGES", position: .bottom, multiline: true, maxLines: 4, controller: cc.proficienciesController)
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
                                ValueBox.square(label: "AC", position: .bottom, align: .center, controller: cc.acController),
                                ValueBox.square(label: "INITIATIVE", position: .bottom, align: .center, controller: cc.initiativeController),
                                ValueBox.square(label: "SPEED", position: .bottom, align: .center, controller: cc.speedController),
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
                                        child: LabeledField(label: "MAX", position: .bottom, align: .center, controller: cc.hpMaxController)
                                      ),
                                      Expanded(
                                        child: LabeledField(label: "CURRENT", position: .bottom, align: .center, controller: cc.hpCurrController)
                                      ),
                                      Expanded(
                                        child: LabeledField(label: "TEMP", position: .bottom, align: .center, controller: cc.hpTempController)
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
                                        LabeledField(label: "TOTAL", position: .left, size: 10, controller: cc.hitDiceTotalController),
                                        LabeledField(label: "HIT DICE", position: .bottom, size: 14, align: .center, controller: cc.hitDiceCurrController)
                                      ]
                                    )
                                  ),
                                ),
                                SavesBox(),
                              ],
                            ),

                            CardSection(
                              child: AttackSection()
                            ),

                            CardSection(
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Expanded(child: LabeledField(label: "CP", position: .top, size: 12, align: .center, controller: cc.cpController)),
                                      Expanded(child: LabeledField(label: "SP", position: .top, size: 12, align: .center, controller: cc.spController)),
                                      Expanded(child: LabeledField(label: "EP", position: .top, size: 12, align: .center, controller: cc.epController)),
                                      Expanded(child: LabeledField(label: "GP", position: .top, size: 12, align: .center, controller: cc.gpController)),
                                      Expanded(child: LabeledField(label: "PP", position: .top, size: 12, align: .center, controller: cc.ppController)),
                                    ]
                                  ),
                                  LabeledField(label: "INVENTORY", position: .bottom, multiline: true, maxLines: 24, controller: cc.inventoryController)
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
                            ValueBox.square(label: "INSPIRATION", position: .right, controller: cc.inspirationController),
                            ValueBox.square(label: "PROFICIENCY BONUS", position: .right, controller: cc.proficiencyBonusController),
                            ValueBox.square(label: "PASSIVE PERCEPTION", position: .right, controller: cc.passivePerceptionController),
                            ValueBox(label: "FEATURES & TRAITS", position: .bottom, multiline: true, maxLines: 30, controller: cc.featuresTraitsController),
                          ]
                        )
                      )
                    
                    ]
                  ),
              

                  Row(      // Spellcasting Header
                    children: [
                      Expanded(
                        child: ValueBox(label: "SPELLCASTING CLASS", position: .bottom, controller: cc.spellcastingClassController)
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ValueBox(label: "SPELLCASTING ABILITY", position: .bottom, controller: cc.spellcastingAbilityController)
                            ),
                            Expanded(
                              child: ValueBox(label: "SPELL SAVE DC", position: .bottom, controller: cc.spellSaveDCController)
                            ),
                            Expanded(
                              child: ValueBox(label: "SPELL ATTACK BONUS", position: .bottom, controller: cc.spellAttackBonusController)
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
                            SpellSection(level: .cantrip),
                            SpellSection(level: .one),
                            SpellSection(level: .two),
                          ]
                        )
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SpellSection(level: .three),
                            SpellSection(level: .four),
                            SpellSection(level: .five),
                          ]
                        )
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SpellSection(level: .six),
                            SpellSection(level: .seven),
                            SpellSection(level: .eight),
                            SpellSection(level: .nine)
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
                            ValueBox(label: "BACKSTORY", position: .top, multiline: true, maxLines: 19, controller: cc.backstoryController)
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
                                      Expanded(child: LabeledField(label: "AGE", position: .bottom, controller: cc.ageController)),
                                      Expanded(child: LabeledField(label: "HEIGHT", position: .bottom, controller: cc.heightController)),
                                      Expanded(child: LabeledField(label: "WEIGHT", position: .bottom, controller: cc.weightController)),
                                    ]
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Expanded(child: LabeledField(label: "EYES", position: .bottom, controller: cc.eyesController)),
                                      Expanded(child: LabeledField(label: "SKIN", position: .bottom, controller: cc.skinController)),
                                      Expanded(child: LabeledField(label: "HAIR", position: .bottom, controller: cc.hairController)),
                                    ]
                                  ),
                                ]
                              )
                            ),
                            ValueBox(label: "PERSONALITY TRAITS", position: .bottom, multiline: true, controller: cc.personalityTraitsController),
                            ValueBox(label: "IDEALS", position: .bottom, multiline: true, controller: cc.idealsController),
                            ValueBox(label: "BONDS", position: .bottom, multiline: true, controller: cc.bondsController),
                            ValueBox(label: "FLAWS", position: .bottom, multiline: true, controller: cc.flawsController),
                          ]
                        ),
                      ),

                    ]
                  ),

                  ValueBox(label: "SESSION NOTES", position: .top, multiline: true, maxLines: 4, controller: cc.sessionNotesController)

                  // END OF CHARACTER SHEET
                ]
              ),
            ),
          ),
        ),


        FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pop(context, character);
          },
          child: Text("SAVE"),
        )
      ],
    );
  }
}