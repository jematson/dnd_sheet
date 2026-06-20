import 'package:flutter/material.dart';
import 'classes/classes.dart';

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
                children: [
                  Expanded(
                    child: ValueBox(label: "CHARACTER NAME", position: .bottom)
                  ),
                ],
              )
            ),

            // Scrollable Main
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(      // First Page Header
                        children: [
                          
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ValueBox(label: "CLASS", position: .bottom)
                                    ),
                                    ValueBox.square(label: "LEVEL", position: .bottom),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ValueBox(label: "RACE", position: .bottom)
                                    ),
                                    Expanded(
                                      child: ValueBox(label: "ALIGMENT", position: .bottom)
                                    ),
                                    Expanded(
                                      child: ValueBox(label: "BACKGROUND", position: .bottom)
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ]
                      ),
                      Row( 
                        crossAxisAlignment: .start,        // First page 3 columns
                        children: [
                  
                          // First Column
                          SizedBox(
                            width: 270,
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
                                          Card(
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
                                          Card(
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
                                    ValueBox.square(label: "AC", position: .bottom),
                                    ValueBox.square(label: "INITIATIVE", position: .bottom),
                                    ValueBox.square(label: "SPEED", position: .bottom),
                                  ],
                                ),
                                Text("HIT POINTS"),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ValueBox(label: "MAX", position: .bottom)
                                    ),
                                    Expanded(
                                      child: ValueBox(label: "CURRENT", position: .bottom)
                                    ),
                                    Expanded(
                                      child: ValueBox(label: "TEMP", position: .bottom)
                                    ),
                                  ],
                                ),
                                SavesBox(),
                                Card(
                                  child: Column(
                                    children: [
                                      Row(
                                        spacing: 4,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text("CP"),
                                                TextField(
                                                  style: TextStyle(fontSize: 10),
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    isDense: true
                                                  ),
                                                )
                                              ]
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text("SP"),
                                                TextField(
                                                  style: TextStyle(fontSize: 10),
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    isDense: true
                                                  ),
                                                )
                                              ]
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text("EP"),
                                                TextField(
                                                  style: TextStyle(fontSize: 10),
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    isDense: true
                                                  ),
                                                )
                                              ]
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text("GP"),
                                                TextField(
                                                  style: TextStyle(fontSize: 10),
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    isDense: true
                                                  ),
                                                )
                                              ]
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text("PP"),
                                                TextField(
                                                  style: TextStyle(fontSize: 10),
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    isDense: true
                                                  ),
                                                )
                                              ]
                                            ),
                                          ),
                                        ]
                                      ),
                                      ValueBox(label: "EQUIPMENT", position: .bottom, multiline: true)
                                    ],
                                  )
                                )
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
