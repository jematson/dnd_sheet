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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(      // First Page Header
                  children: [
                    EValueBox(value: "CHARACTER NAME", direction: Direction.bottom),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              EValueBox(value: "CLASS", direction: Direction.bottom),
                              EValueBox(value: "LEVEL", direction: Direction.bottom),
                              EValueBox(value: "PLAYER NAME", direction: Direction.bottom),
                            ],
                          ),
                          Row(
                            children: [
                              EValueBox(value: "RACE", direction: Direction.bottom),
                              EValueBox(value: "ALIGNMENT", direction: Direction.bottom),
                              EValueBox(value: "BACKGROUND", direction: Direction.bottom),
                            ],
                          )
                        ],
                      ),
                    )
                  ]
                ),
                Row(         // First page 3 columns
                  children: [
            
                    // First Column
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: Column(
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
                                    EValueBox(value: "INSPIRATION", direction: .right),
                                    EValueBox(value: "PROFICIENCY\nBONUS", direction: .right),
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
                          EValueBox(value: "   PASSIVE PERCEPTION", direction: .right)
                        ]
                      )
                    ),
            
                    // Second Column
                    Expanded(
                      child: Column(
                        mainAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              EValueBox(value: "ARMOR\nCLASS", direction: .bottom),
                              EValueBox(value: "INITIATIVE", direction: .bottom),
                              EValueBox(value: "SPEED", direction: .bottom),
                            ],
                          ),
                          Text("HIT POINTS"),
                          Row(
                            children: [
                              EValueBox(value: "MAX", direction: .bottom),
                              EValueBox(value: "CURRENT", direction: .bottom),
                              EValueBox(value: "TEMP", direction: .bottom),
                            ],
                          ),
                          SavesBox()
                        ]
                      )
                    ),
            
                    // Third Column
                    Expanded(
                      child: Column(
                        mainAxisAlignment: .start,
                        children: [
                          ValueBox(value: "PERSONALITY TRAITS", direction: .bottom, lines: null),
                          ValueBox(value: "IDEALS", direction: .bottom, lines: null),
                          ValueBox(value: "BONDS", direction: .bottom, lines: null),
                          ValueBox(value: "FLAWS", direction: .bottom, lines: null),
                          ValueBox(value: "FEATURES & TRAITS", direction: .bottom, lines: null),
                        ]
                      )
                    )
            
            
                    
                  ]
                ),
            
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
            
                        ]
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SpellSection(level: .cantrip),
                        ]
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
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
    );
  }
}
