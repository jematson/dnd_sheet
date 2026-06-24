import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import './character_page.dart';
import './classes/classes.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  const minimumSize = Size(765, 100);

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: minimumSize
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

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
  List<DNDCharacter> characters = [];
  final characterManager = CharacterManager();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCharacters();
    });
  }

  Future<void> _loadCharacters() async {
    setState(() => _isLoading = true);

    final chars = await characterManager.loadCharacters();

    setState(() {
      characters = chars;
      _isLoading = false;
    });
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
              child: _isLoading ?
              CircularProgressIndicator()
              :
              SingleChildScrollView(
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
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (context) => CharacterPage(character: characters[index], manager: characterManager)
                                )
                              );
                              final newChar = result as DNDCharacter;
                              await characterManager.saveCharacter(newChar);
                              setState(() {
                                characters[index] = newChar;
                              });
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
                                      onPressed: () async {
                                        await characterManager.archiveCharacter(characters[index]);
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
                  onPressed: () async {
                    final newCharacter = DNDCharacter(fileID: Uuid().v1().toString());
                    await characterManager.saveCharacter(newCharacter);

                    if (!context.mounted) return;
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => CharacterPage(character: newCharacter, manager: characterManager)
                      )
                    );
                    final newChar = result as DNDCharacter;
                    await characterManager.saveCharacter(newChar);
                    setState(() {
                      characters.add(newChar);
                    });
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
