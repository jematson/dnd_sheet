/*
 *   Author: Jenae Matson
 *   Create Time: 2026-06-15 18:29
 *   Modified by: Jenae Matson
 *   Modified time: 2026-06-24 17:50
 *   Description: Widgets for labeled entry boxes for values on the 
 *                Character Sheet page.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/classes.dart';


enum LabelPosition { left, right, top, bottom }


class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    this.position = LabelPosition.bottom,
    this.square = false,
    this.multiline = false,
    this.size = 14,
    this.align = .start,
    this.maxLines = 2,
    this.formatter,
    required this.controller,
  });

  const LabeledField.square({
    super.key,
    required this.label,
    this.position = LabelPosition.bottom,
    this.multiline = false,
    this.size = 16,
    this.align = .start,
    this.maxLines = 2,
    this.formatter,
    required this.controller,
  }) : square = true;

  final String label;
  final LabelPosition position;
  final bool square;
  final bool multiline;
  final double size;
  final TextAlign align;
  final int maxLines;
  final TextEditingController controller;
  final FilteringTextInputFormatter? formatter;

  Widget _field() {
    Widget field = TextField(
      textAlign: align,
      style: TextStyle(fontSize: size),
      controller: controller,
      minLines: multiline ? maxLines : 1,
      maxLines: multiline ? null : 1,
      inputFormatters: formatter == null ? [] : [formatter!],
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2.0)
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

    final field = _field();

    return switch (position) {
      LabelPosition.left => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          labelWidget,
          const SizedBox(width: 8),
          if (square)
            field
          else
            Expanded(child: field),
        ],
      ),

      LabelPosition.right => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (square)
            field
          else
            Expanded(child: field),
          const SizedBox(width: 8),
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
  }
}




class ValueBox extends StatelessWidget {
  const ValueBox({
    super.key,
    required this.label,
    this.position = LabelPosition.bottom,
    this.square = false,
    this.multiline = false,
    this.size = 16,
    this.align = .start,
    this.maxLines = 2,
    this.formatter,
    required this.controller,
  });

  const ValueBox.square({
    super.key,
    required this.label,
    this.position = LabelPosition.bottom,
    this.multiline = false,
    this.size = 16,
    this.align = .start,
    this.maxLines = 2,
    this.formatter,
    required this.controller,
  }) : square = true;

  final String label;
  final LabelPosition position;
  final bool square;
  final bool multiline;
  final double size;
  final TextAlign align;
  final int maxLines;
  final TextEditingController controller;
  final FilteringTextInputFormatter? formatter;

  @override
  Widget build(BuildContext context) {
    return CardSection(
      child: LabeledField(
        label: label,
        position: position,
        square: square,
        multiline: multiline,
        size: size,
        align: align,
        maxLines: maxLines,
        controller: controller,
        formatter: formatter,
      ),
    );
  }
}



class CardSection extends StatelessWidget {
  const CardSection({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onInverseSurface,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}




class SavesBox extends StatelessWidget {
  final DeathSavesController saves;

  const SavesBox({
    super.key,
    required this.saves,
  });


  @override
  Widget build(BuildContext context) {
    return CardSection(
      child: SizedBox(
        width: 125,
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
                ValueListenableBuilder(
                  valueListenable: saves.s1,
                  builder: (_, v, _) {
                    return SizedBox(
                      width: 20,
                      height: 30,
                      child: IconButton(
                        iconSize: 15,
                        icon: Icon(v ? Icons.circle : Icons.circle_outlined),
                        onPressed: () {
                          saves.s1.value = !saves.s1.value;
                        },
                      ),
                    );
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: saves.s2,
                  builder: (_, v, _) {
                    return SizedBox(
                      width: 20,
                      height: 30,
                      child: IconButton(
                        iconSize: 15,
                        icon: Icon(v ? Icons.circle : Icons.circle_outlined),
                        onPressed: () {
                          saves.s2.value = !saves.s2.value;
                        },
                      ),
                    );
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: saves.s3,
                  builder: (_, v, _) {
                    return SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        iconSize: 15,
                        icon: Icon(v ? Icons.circle : Icons.circle_outlined),
                        onPressed: () {
                          saves.s3.value = !saves.s3.value;
                        },
                      ),
                    );
                  }
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
                ValueListenableBuilder(
                  valueListenable: saves.f1,
                  builder: (_, v, _) {
                    return SizedBox(
                      width: 20,
                      height: 30,
                      child: IconButton(
                        iconSize: 15,
                        icon: Icon(v ? Icons.circle : Icons.circle_outlined),
                        onPressed: () {
                          saves.f1.value = !saves.f1.value;
                        },
                      ),
                    );
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: saves.f2,
                  builder: (_, v, _) {
                    return SizedBox(
                      width: 20,
                      height: 30,
                      child: IconButton(
                        iconSize: 15,
                        icon: Icon(v ? Icons.circle : Icons.circle_outlined),
                        onPressed: () {
                          saves.f2.value = !saves.f2.value;
                        },
                      ),
                    );
                  }
                ),
                ValueListenableBuilder(
                  valueListenable: saves.f3,
                  builder: (_, v, _) {
                    return SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        iconSize: 15,
                        icon: Icon(v ? Icons.circle : Icons.circle_outlined),
                        onPressed: () {
                          saves.f3.value = !saves.f3.value;
                        },
                      ),
                    );
                  }
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}