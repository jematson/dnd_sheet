
class Spell {
  final SpellLevel level;
  String name;
  String description;
  bool prepared;

  Spell({
    required this.level,
    this.name = "",
    this.description = "",
    this.prepared = false,
  });
}

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