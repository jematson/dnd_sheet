import 'package:dnd_sheet/classes/classes.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class CharacterManager {

  Future<Directory> get _charactersPath async {
    final directory = await getApplicationDocumentsDirectory();

    final characterDirectory = Directory('${directory.path}/D&DSheets/characters');

    if (!await characterDirectory.exists()) {
      await characterDirectory.create(recursive: true);
    }

    return characterDirectory;
  }


  Future<List<DNDCharacter>> loadCharacters() async {
    final dir = await _charactersPath;

    List<DNDCharacter> characters = [];

    await for (final entity in dir.list()) {
      if (entity is File && entity.path.endsWith('.json')) {
        final jsonString = await entity.readAsString();

        final character = DNDCharacter.fromJson(
          jsonDecode(jsonString)
        );

        if (!character.archived) {
          characters.add(character);
        }
      }
    }

    return characters;
  }


  Future<File> _characterFileReference(String id) async {
    final dir = await _charactersPath;
    final path = dir.path;
    return File('$path/$id.json');
  }


  Future<void> saveCharacter(DNDCharacter character) async {
    final fileRef = await _characterFileReference(character.fileID);
    
    final jsonString = jsonEncode(character.toJson());

    await fileRef.writeAsString(jsonString);
  }


  Future<void> archiveCharacter(DNDCharacter character) async {
    character.archived = true;

    saveCharacter(character);
  }

}