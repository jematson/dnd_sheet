import 'package:flutter/material.dart';


enum LabelPosition { left, right, top, bottom }


class ValueBox extends StatelessWidget {
  const ValueBox({
    super.key,
    required this.label,
    this.position = LabelPosition.top,
    this.square = false,
    this.expand = false,
    this.multiline = false,
    this.controller,
  });

  const ValueBox.square({
    super.key,
    required this.label,
    this.position = LabelPosition.top,
    this.multiline = false,
    this.controller,
  })  : square = true,
        expand = false;

  const ValueBox.expanded({
    super.key,
    required this.label,
    this.position = LabelPosition.top,
    this.multiline = false,
    this.controller,
  })  : square = false,
        expand = true;

  final String label;
  final LabelPosition position;

  /// Fixed width box
  final bool square;

  /// Wrap the whole widget in Expanded
  final bool expand;

  /// Grow vertically
  final bool multiline;

  final TextEditingController? controller;

  Widget _textField() {
    Widget field = TextField(
      controller: controller,
      minLines: multiline ? 1 : 1,
      maxLines: multiline ? null : 1,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );

    if (square) {
      field = SizedBox(
        width: 60,
        child: field,
      );
    }

    return field;
  }

  @override
  Widget build(BuildContext context) {
    final labelWidget = Text(
      label,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    );

    final field = _textField();

    Widget child = switch (position) {
      LabelPosition.left => Row(
          spacing: 10,
          children: [
            labelWidget,
            Expanded(child: field),
          ],
        ),

      LabelPosition.right => Row(
          spacing: 10,
          children: [
            Expanded(child: field),
            labelWidget,
          ],
        ),

      LabelPosition.top => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelWidget,
            field,
          ],
        ),

      LabelPosition.bottom => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            field,
            labelWidget,
          ],
        ),
    };

    if (expand) {
      child = Expanded(child: child);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
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