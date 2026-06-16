import 'package:flutter/material.dart';
import 'classes/classes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: apptheme,
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Row(        // First Page Header
                children: [
                  EValueBox(
                    value: "CHARACTER NAME"
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            EValueBox(value: "CLASS & LEVEL"),
                            EValueBox(value: "BACKGROUND"),
                            EValueBox(value: "PLAYER NAME"),
                          ],
                        ),
                        Row(
                          children: [
                            EValueBox(value: "RACE"),
                            EValueBox(value: "ALIGNMENT"),
                            EValueBox(value: "EXPERIENCE POINTS"),
                          ],
                        )
                      ],
                    ),
                  )
                ]
              ),
              Row(      
                children: [
                  Column(
                    children: [
          
                    ]),
                  Column(
                    children: [
          
                    ]),
                  Column(
                    children: [
          
                    ]),
                ])
            ]
          ),
        ),
      ),
    );
  }
}
