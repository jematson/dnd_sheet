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
        return "CANTRIPS";
    }
  }
}


class Spell {
  final String name;
  final String description;

  const Spell({
    this.name = "",
    this.description = "",
  });
}


// Individual Spell Line

class SpellLine extends StatefulWidget {
  const SpellLine({
    super.key,
    this.prepared = false,
    this.cantrip = false,
    this.spell = const Spell(),
  });

  final bool prepared;
  final bool cantrip;
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
        if (!widget.cantrip) SizedBox(
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
            onPressed: (){}, 
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

  var spells = <SpellLine>[];

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
                      spells.add(SpellLine(cantrip: widget.level == .cantrip));
                    });
                  },
                ),
              ),
            ]
          )
        ),
        Column(
          children: spells
        )
      ],
    );
  }
}