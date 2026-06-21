import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets.dart';

class SkillLine extends StatefulWidget {
  const SkillLine({
    super.key,
    required this.value,
    this.pressed = false,
    required this.controller,
  });

  final String value;
  final bool pressed;
  final TextEditingController controller;

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
            controller: widget.controller,
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
    required this.value,
    required this.controller,
    required this.modController,
  });

  final String value;
  final TextEditingController controller;
  final TextEditingController modController;

  @override
  Widget build(BuildContext context) {
    return CardSection(
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
              controller: controller,
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
              controller: modController,
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
    );
  }
}