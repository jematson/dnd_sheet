import 'package:flutter/material.dart';
import './widgets.dart';
import '../classes/classes.dart';


// Individual Spell Line

class SpellLine extends StatefulWidget {
  const SpellLine({
    super.key,
    required this.spell,
    required this.spellSaved,
    required this.deleteSpell,
  });

  final Spell spell;
  final void Function(Spell) spellSaved;
  final void Function() deleteSpell;

  @override
  State<SpellLine> createState() => _SpellLineState();
}

class _SpellLineState extends State<SpellLine> {

  @override
  void initState() {
    super.initState();
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
            icon: Icon(widget.spell.prepared ? Icons.circle : Icons.circle_outlined),
            onPressed: () {
              setState(() {
                widget.spell.prepared = !widget.spell.prepared;
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
                    content: SpellBox(
                      spell: widget.spell,
                      spellSaved: (spell) {
                        widget.spellSaved(spell);
                        Navigator.pop(context);
                      },
                      deleteSpell: () {
                        widget.deleteSpell();
                        Navigator.pop(context);
                      }
                    )
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

class SpellSection extends StatelessWidget {
  final SpellLevel level;
  final SpellSectionController spells;

  const SpellSection({
    super.key,
    required this.level,
    required this.spells,
  });


    @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: spells.spellsController,
      builder: (_, spellList, _) {
        return Column(
          children: [
            CardSection(
              child: Row(
                children:[
                  level == .cantrip
                  ?Expanded(
                      child: Text("CANTRIPS", textAlign: .center)
                  )
                  :Expanded(
                    child: Row(
                      spacing: 5,
                      children: [
                        Text(
                          level.num,
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
        
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        spells.spellsController.value = [...spellList,(Spell(level: level))];
                      },
                    ),
                  ),
                ]
              )
            ),
            Column(
              spacing: 5,
              children: List.generate(
                spellList.length,
                (index) => SpellLine(
                  spell: spellList[index],
                  spellSaved: (updatedSpell) {
                    final newList = List<Spell>.from(spellList);
                    newList[index] = updatedSpell;
                    spells.spellsController.value = newList;
                  },
                  deleteSpell: () {
                    final newList = List<Spell>.from(spellList);
                    newList.removeAt(index);
                    spells.spellsController.value = newList;
                  }
                ),
              )
            )
          ],
        );
      }
    );
  }
}



// Spell Box

class SpellBox extends StatefulWidget {
  const SpellBox({
    super.key,
    required this.spell,
    required this.spellSaved,
    required this.deleteSpell,
  });

  final void Function(Spell) spellSaved;
  final void Function() deleteSpell;
  final Spell spell;

  @override
  State<SpellBox> createState() => _SpellBoxState();
}

class _SpellBoxState extends State<SpellBox> {
  late Spell spell;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  void _saveSpell() {
    setState(() {
      spell.name = nameController.text;
      spell.description = descriptionController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    spell = widget.spell;
    nameController.text = spell.name;
    descriptionController.text = spell.description;
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
                      controller: nameController,
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
                controller: descriptionController,
                maxLines: null,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                  border: OutlineInputBorder()
                ),
              ),
              Text("SPELL DESCRIPTION", style: TextStyle(fontSize: 8)),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.deleteSpell();
                    }, 
                    icon: Icon(
                      Icons.delete_outline, 
                      color: const Color.fromARGB(255, 220, 26, 1),
                      size: 30,
                    )
                  ),
                  TextButton(
                    child: Text("SAVE SPELL"),
                    onPressed: () {
                      _saveSpell();
                      widget.spellSaved(spell);
                    }
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}