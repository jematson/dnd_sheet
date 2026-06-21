import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import './character_page.dart';
import './classes/dnd_character.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: apptheme,
      home: HomePage()
    );
  }
}



// Home Page

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DNDCharacter> characters = [
    DNDCharacter(name: "Frederick Cumbersnatch"),
    DNDCharacter(name: "Jacquard Horowitz"),
    DNDCharacter(name: "Flash Gamgee")
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: SizedBox(
              width: 400,
              height: 70,
              child: Center(
                child: Text("D&D Characters", 
                  textAlign: .center,
                  style: TextStyle(fontSize: 30, fontWeight: .bold)
                )
              )
            )
          ),
      
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: List.generate(
                    characters.length,
                    (index) => Row(
                      mainAxisAlignment: .center,
                      children: [
                        SizedBox(
                          width: 450,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (context) => CharacterPage(character: characters[index])
                                )
                              );
                            }, 
                            child: Text(characters[index].name, style: TextStyle(fontSize: 20))
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Delete ${characters[index].name}?"),
                                  content: Text("Would you like to delete this character?"),
                                  actions: [
                                    FilledButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      child: Text("Cancel")
                                    ),
                                    FilledButton(
                                      style: FilledButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                                      onPressed: (){
                                        setState(() {
                                          characters.removeAt(index);
                                          Navigator.pop(context);
                                        });
                                      }, 
                                      child: Text("DELETE")
                                    ),
                                  ],
                                  actionsAlignment: .spaceBetween,
                                );
                              }
                            );
                          }, 
                          icon: Icon(Icons.delete, color: const Color.fromARGB(255, 204, 17, 3)),
                          iconSize: 40,
                        )
                      ],
                    )
                  )
                )
              )
            )
          ),
      
          Card(
            child: SizedBox(
              width: 600,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 200),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => CharacterPage(character: DNDCharacter())
                      )
                    );
                  }, 
                  child: Text("NEW CHARACTER")
                ),
              )
            )
          ),
        ]
      ),
    );
  }
}
