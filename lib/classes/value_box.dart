import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


enum Direction { left, right, top, bottom }


class ValueBox extends StatelessWidget {
  const ValueBox({
    super.key, 
    required this.value,
    required this.direction,
    this.lines = 1,
    this.square = false,
  });

  final String value;
  final Direction direction;
  final int? lines;
  final bool square;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: switch (direction) {

          Direction.left => Row(
            children: [
              Text(value, style: TextStyle(fontSize: 10, fontWeight: .w400)),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder()
                  ),
                  maxLines: lines,
                ),
              )
            ]
          ),

          Direction.right => Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder()
                  ),
                  maxLines: lines,
                ),
              ),
              Text(value, style: TextStyle(fontSize: 10, fontWeight: .w400))
            ]
          ),

          Direction.top => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(value, style: TextStyle(fontSize: 10, fontWeight: .w400)),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
                maxLines: lines,
              )
            ]
          ),
        
          Direction.bottom => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
                maxLines: lines,
              ),
              Text(value, style: TextStyle(fontSize: 10, fontWeight: .w400))
            ]
          ),
        }
      )
    );
  }
}


class EValueBox extends StatelessWidget {
  const EValueBox({
    super.key,
    required this.value,
    required this.direction,
    this.lines = 1,
    this.square = false,
  });

  final String value;
  final Direction direction;
  final int? lines;
  final bool square;

  @override
  Widget build(BuildContext context) {
    if (direction == .left || direction == .right) {
      return ValueBox(value: value, direction: direction, lines: lines, square: square);
    } else {
      return Expanded(
        child: ValueBox(value: value, direction: direction, lines: lines, square: square),
      );
    }
  }
}



class SkillLine extends StatefulWidget {
  const SkillLine({
    super.key,
    required this.value,
    this.pressed = false,
  });

  final String value;
  final bool pressed;

  @override
  State<SkillLine> createState() => _SkillLineState();
}

class _SkillLineState extends State<SkillLine> {
  late bool pressed;

  @override
  void initState() {
    super.initState();
    pressed = widget.pressed;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: IconButton(
            iconSize: 15,
            icon: Icon(pressed ? Icons.circle : Icons.circle_outlined),
            onPressed: () {
              setState(() {
                pressed = !pressed;
              });
            },
          ),
        ),
        SizedBox(
          width: 25,
          child: TextField(
            textAlign: .center,
            style: TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
            ),
          )
        ),
        Text(
          widget.value,
          style: TextStyle(fontSize: 12)
        )
      ]
    );
  }
}



class AbilityBox extends StatelessWidget {
  const AbilityBox({
    super.key,
    required this.value
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        child: Column(
          children: [
            Text(
              value,
              textAlign: .center,
              style: TextStyle(fontSize: 12)
            ),
            SizedBox(
              width: 50,
              child: TextField(
                textAlign: .center,
                textAlignVertical: .center,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                  border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(
              width: 27,
              height: 27,
              child: TextField(
                textAlign: .center,
                textAlignVertical: .center,
                style: TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 1),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class SavesBox extends StatefulWidget {
  const SavesBox({
    super.key,
    this.success1 = false,
    this.success2 = false,
    this.success3 = false,
    this.failure1 = false,
    this.failure2 = false,
    this.failure3 = false,
  });

  final bool success1;
  final bool success2;
  final bool success3;
  final bool failure1;
  final bool failure2;
  final bool failure3;

  @override
  State<SavesBox> createState() => _SavesBoxState();
}

class _SavesBoxState extends State<SavesBox> {
  late bool success1;
  late bool success2;
  late bool success3;
  late bool failure1;
  late bool failure2;
  late bool failure3;

  @override
  void initState() {
    super.initState();
    success1 = widget.success1;
    success2 = widget.success2;
    success3 = widget.success3;
    failure1 = widget.failure1;
    failure2 = widget.failure2;
    failure3 = widget.failure3;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 130,
        child: Column(
          children: [
            Text(
              "DEATH SAVES",
              style: TextStyle(fontSize: 12)
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                Text(
                  "SUCCESSES",
                  style: TextStyle(fontSize: 10)
                ),
                SizedBox(
                  width: 20,
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(success1 ? Icons.circle : Icons.circle_outlined),
                    onPressed: () {
                      setState(() {
                        success1 = !success1;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(success2 ? Icons.circle : Icons.circle_outlined),
                    onPressed: () {
                      setState(() {
                        success2 = !success2;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(success3 ? Icons.circle : Icons.circle_outlined),
                    onPressed: () {
                      setState(() {
                        success3 = !success3;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                Text(
                  "FAILURES",
                  style: TextStyle(fontSize: 10)
                ),
                SizedBox(
                  width: 20,
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(failure1 ? Icons.circle : Icons.circle_outlined),
                    onPressed: () {
                      setState(() {
                        failure1 = !failure1;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(failure2 ? Icons.circle : Icons.circle_outlined),
                    onPressed: () {
                      setState(() {
                        failure2 = !failure2;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(failure3 ? Icons.circle : Icons.circle_outlined),
                    onPressed: () {
                      setState(() {
                        failure3 = !failure3;
                      });
                    },
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}