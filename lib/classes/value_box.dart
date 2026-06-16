import 'package:flutter/material.dart';


class ValueBox extends StatelessWidget {
  const ValueBox({
    super.key, 
    required this.value
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              )
            ),
            Text(value, style: TextStyle(fontSize: 10, fontWeight: .w400))
          ]
        ),
      )
    );
  }
}


class EValueBox extends StatelessWidget {
  const EValueBox({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueBox(value: value),
    );
  }
}