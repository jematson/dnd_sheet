import 'package:flutter/material.dart';

enum SpellLevel { cantrip, one, two, three, four, five, six, seven, eight, nine }
extension SpellLevels on SpellLevel {
  String get num {
    switch (this) {
      case SpellLevel.one:
        return "1";
      case SpellLevel.two:
        return "2";
      case SpellLevel.three:
        return "3";
      case SpellLevel.four:
        return "4";
      case SpellLevel.five:
        return "5";
      case SpellLevel.six:
        return "6";
      case SpellLevel.seven:
        return "7";
      case SpellLevel.eight:
        return "8";
      case SpellLevel.nine:
        return "9";
      case SpellLevel.cantrip:
        return "CANTRIP";
    }
  }
}


class Spell {
  final String name;
  final SpellLevel level;
  final String description;

  const Spell({
    required this.level,
    this.name = "",
    this.description = "",
  });
}


// Individual Spell Line

class SpellLine extends StatefulWidget {
  const SpellLine({
    super.key,
    this.prepared = false,
    required this.spell,
  });

  final bool prepared;
  final Spell spell;

  @override
  State<SpellLine> createState() => _SpellLineState();
}

class _SpellLineState extends State<SpellLine> {
  late bool prepared;

  @override
  void initState() {
    super.initState();
    prepared = widget.prepared;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!(widget.spell.level == .cantrip)) SizedBox(
          width: 30,
          height: 30,
          child: IconButton(
            iconSize: 15,
            icon: Icon(prepared ? Icons.circle : Icons.circle_outlined),
            onPressed: () {
              setState(() {
                prepared = !prepared;
              });
            },
          ),
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: SpellBox(spell: widget.spell)
                  );
                }
              );
            }, 
            child: Text(widget.spell.name),
          ),
        )
      ]
    );
  }
}



// Spell Level Section

class SpellSection extends StatefulWidget {
  const SpellSection({
    super.key,
    required this.level,
  });

  final SpellLevel level;

  @override
  State<SpellSection> createState() => _SpellSectionState();
}

class _SpellSectionState extends State<SpellSection> {
  @override
  void initState() {
    super.initState();
  }

  var spells = <Spell>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            children:[
              widget.level == .cantrip
              ?Expanded(
                  child: Text("CANTRIPS", textAlign: .center)
              )
              :Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      Text(
                        widget.level.num,
                        style: TextStyle(fontSize: 20), 
                        textAlign: .center
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("SLOTS TOTAL", style: TextStyle(fontSize: 8)),
                            TextField(
                              textAlignVertical: .center,
                              style: TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("SLOTS EXPENDED", style: TextStyle(fontSize: 8)),
                            TextField(
                              textAlignVertical: .center,
                              style: TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      spells.add(Spell(level: widget.level));
                    });
                  },
                ),
              ),
            ]
          )
        ),
        Column(
          children: spells.map((spell) => SpellLine(spell: spell)).toList()
        )
      ],
    );
  }
}



// Spell Box

class SpellBox extends StatefulWidget {
  const SpellBox({
    super.key,
    required this.spell,
  });

  final Spell spell;

  @override
  State<SpellBox> createState() => _SpellBoxState();
}

class _SpellBoxState extends State<SpellBox> {
  late Spell spell;

  @override
  void initState() {
    super.initState();
    spell = widget.spell;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(spell.level == .cantrip ? "Cantrip" : "Level ${spell.level.num} Spell"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                child: Column(
                  children: [
                    TextField(
                      textAlign: .center,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                        border: OutlineInputBorder()
                      ),
                    ),
                    Text("SPELL NAME", style: TextStyle(fontSize: 8)),
                  ],
                ),
              ),
              TextField(
                maxLines: null,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                  border: OutlineInputBorder()
                ),
              ),
              Text("SPELL DESCRIPTION", style: TextStyle(fontSize: 8)),
            ],
          ),
        )
      )
    );
  }
}