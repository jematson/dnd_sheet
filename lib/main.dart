import 'package:flutter/material.dart';
import 'classes/classes.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: apptheme,
      home: Scaffold(
        body: Column(
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
                                ValueBox.square(label: "INSPIRATION", position: .right),
                                ValueBox.square(label: "PROFICIENCY BONUS", position: .right),
                                ValueBox.square(label: "PASSIVE PERCEPTION", position: .right)
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

                                SavesBox(),

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
                                      LabeledField(label: "EQUIPMENT", position: .bottom, multiline: true)
                                    ],
                                  )
                                ),


                              ]
                            )
                          ),
                  
                          // Third Column
                          Expanded(
                            child: Column(
                              mainAxisAlignment: .start,
                              children: [
                                ValueBox(label: "PERSONALITY TRAITS", position: .bottom, multiline: true),
                                ValueBox(label: "IDEALS", position: .bottom, multiline: true),
                                ValueBox(label: "BONDS", position: .bottom, multiline: true),
                                ValueBox(label: "FLAWS", position: .bottom, multiline: true),
                                ValueBox(label: "FEATURES & TRAITS", position: .bottom, multiline: true),
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
                      )
                  
                  
                    ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
