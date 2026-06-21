import 'package:dnd_sheet/classes/dnd_character.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

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

  final nameController = TextEditingController();
  final levelController = TextEditingController();


  @override
  void initState() {
    super.initState();
    character = widget.character;
    editedCharacter = widget.character; // MAKE DEEP COPY
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
                child: LabeledField(label: "CHARACTER NAME", position: .bottom, size: 22)
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        LabeledField.square(label: "LEVEL", position: .bottom, align: .center),
                        Expanded(
                          child: LabeledField(label: "CLASS", position: .bottom)
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: LabeledField(label: "RACE", position: .bottom)
                        ),
                        Expanded(
                          child: LabeledField(label: "ALIGNMENT", position: .bottom)
                        ),
                        Expanded(
                          child: LabeledField(label: "BACKGROUND", position: .bottom)
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
                                      AbilityBox(value: "STR"),
                                      AbilityBox(value: "DEX"),
                                      AbilityBox(value: "CON"),
                                      AbilityBox(value: "INT"),
                                      AbilityBox(value: "WIS"),
                                      AbilityBox(value: "CHA"),
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
                                            SkillLine(value: "Strength"),
                                            SkillLine(value: "Dexterity"),
                                            SkillLine(value: "Constitution"),
                                            SkillLine(value: "Intelligence"),
                                            SkillLine(value: "Wisdom"),
                                            SkillLine(value: "Charisma"),
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
                                            SkillLine(value: "Acrobatics (dex)"),
                                            SkillLine(value: "Animal Handling (wis)"),
                                            SkillLine(value: "Arcana (int)"),
                                            SkillLine(value: "Athletics (str)"),
                                            SkillLine(value: "Deception (cha)"),
                                            SkillLine(value: "History (int)"),
                                            SkillLine(value: "Insight (wis)"),
                                            SkillLine(value: "Intimidation (cha)"),
                                            SkillLine(value: "Investigation (int)"),
                                            SkillLine(value: "Medicine (wis)"),
                                            SkillLine(value: "Nature (wis)"),
                                            SkillLine(value: "Perception (wis)"),
                                            SkillLine(value: "Performance (cha)"),
                                            SkillLine(value: "Persuasion (cha)"),
                                            SkillLine(value: "Religion (int)"),
                                            SkillLine(value: "Sleight of Hand (dex)"),
                                            SkillLine(value: "Stealth (dex)"),
                                            SkillLine(value: "Survival (wis)"),
                                          ]
                                        )
                                      ),
                                    ]
                                  )
                                ),
                              ]
                            ),

                            ValueBox(label: "PROFICIENCIES & LANGUAGES", position: .bottom, multiline: true, maxLines: 4)
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
                                ValueBox.square(label: "AC", position: .bottom, align: .center),
                                ValueBox.square(label: "INITIATIVE", position: .bottom, align: .center),
                                ValueBox.square(label: "SPEED", position: .bottom, align: .center),
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
                                        child: LabeledField(label: "MAX", position: .bottom, align: .center)
                                      ),
                                      Expanded(
                                        child: LabeledField(label: "CURRENT", position: .bottom, align: .center)
                                      ),
                                      Expanded(
                                        child: LabeledField(label: "TEMP", position: .bottom, align: .center)
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
                                        LabeledField(label: "TOTAL", position: .left, size: 10),
                                        LabeledField(label: "HIT DICE", position: .bottom, size: 14, align: .center)
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
                                      Expanded(child: LabeledField(label: "CP", position: .top, size: 12, align: .center)),
                                      Expanded(child: LabeledField(label: "SP", position: .top, size: 12, align: .center)),
                                      Expanded(child: LabeledField(label: "EP", position: .top, size: 12, align: .center)),
                                      Expanded(child: LabeledField(label: "GP", position: .top, size: 12, align: .center)),
                                      Expanded(child: LabeledField(label: "PP", position: .top, size: 12, align: .center)),
                                    ]
                                  ),
                                  LabeledField(label: "INVENTORY", position: .bottom, multiline: true, maxLines: 24)
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
                            ValueBox.square(label: "INSPIRATION", position: .right),
                            ValueBox.square(label: "PROFICIENCY BONUS", position: .right),
                            ValueBox.square(label: "PASSIVE PERCEPTION", position: .right),
                            ValueBox(label: "FEATURES & TRAITS", position: .bottom, multiline: true, maxLines: 30),
                          ]
                        )
                      )
                    
                    ]
                  ),
              

                  Row(      // Spellcasting Header
                    children: [
                      Expanded(
                        child: ValueBox(label: "SPELLCASTING CLASS", position: .bottom)
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ValueBox(label: "SPELLCASTING ABILITY", position: .bottom)
                            ),
                            Expanded(
                              child: ValueBox(label: "SPELL SAVE DC", position: .bottom)
                            ),
                            Expanded(
                              child: ValueBox(label: "SPELL ATTACK BONUS", position: .bottom)
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
                            ValueBox(label: "BACKSTORY", position: .top, multiline: true, maxLines: 19)
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
                                      Expanded(child: LabeledField(label: "AGE", position: .bottom)),
                                      Expanded(child: LabeledField(label: "HEIGHT", position: .bottom)),
                                      Expanded(child: LabeledField(label: "WEIGHT", position: .bottom)),
                                    ]
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Expanded(child: LabeledField(label: "EYES", position: .bottom)),
                                      Expanded(child: LabeledField(label: "SKIN", position: .bottom)),
                                      Expanded(child: LabeledField(label: "HAIR", position: .bottom)),
                                    ]
                                  ),
                                ]
                              )
                            ),
                            ValueBox(label: "PERSONALITY TRAITS", position: .bottom, multiline: true),
                            ValueBox(label: "IDEALS", position: .bottom, multiline: true),
                            ValueBox(label: "BONDS", position: .bottom, multiline: true),
                            ValueBox(label: "FLAWS", position: .bottom, multiline: true),
                          ]
                        ),
                      ),

                    ]
                  ),

                  ValueBox(label: "SESSION NOTES", position: .top, multiline: true, maxLines: 4)

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