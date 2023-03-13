import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Num extends StatefulWidget {
  const Num({super.key});

  @override
  State<Num> createState() => _NumState();
}

class _NumState extends State<Num> {
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumberPicker(
              value: _currentValue,
              minValue: 0,
              maxValue: 100,
              itemCount: 3,
              onChanged: (value) => setState(() => _currentValue = value),
            ),
            Text('Current value: $_currentValue'),
          ],
        ),
      ),
    );
  }
}
