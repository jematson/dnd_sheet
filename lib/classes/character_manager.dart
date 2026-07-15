/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-22 20:07
 *   Modified by: Jenae Matson
 *   Modified time: 2026-07-14 21:32
 *   Description: Class to manage the saving and fetching 
 *                of D&D Character objects in local JSON files.
 */

import 'package:dnd_sheet/classes/classes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class CharacterManager {

  bool get isDebugMode {
    return kDebugMode;
  }

  Future<Directory> get _charactersPath async {
    final directory = await getApplicationDocumentsDirectory();

    final characterDirectory = isDebugMode 
          ? Directory('${directory.path}/D&DSheets/testing_characters')
          : Directory('${directory.path}/D&DSheets/characters');

    if (!await characterDirectory.exists()) {
      await characterDirectory.create(recursive: true);
    }

    return characterDirectory;
  }

  Future<Directory> get _portraitsPath async {
    final directory = await getApplicationDocumentsDirectory();

    final imgDirectory = Directory('${directory.path}/D&DSheets/characterPortraits');

    if (!await imgDirectory.exists()) {
      await imgDirectory.create(recursive: true);
    }

    return imgDirectory;
  }


  Future<File> _characterFileReference(String id) async {
    final dir = await _charactersPath;
    final path = dir.path;
    return File('$path/$id.json');
  }

  Future<File> loadPortrait(String id) async {
    final dir = await _portraitsPath;
    final path = dir.path;
    return File('$path/$id.png');
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

  Future<void> savePortrait(File img, String charId) async {
    final fileRef = await loadPortrait(charId);
    await img.copy(fileRef.path);
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