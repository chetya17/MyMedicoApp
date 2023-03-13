import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  final String dat;
  const MyTest({super.key, required this.dat});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 207, 171, 183),
      child: Column(
        children: [const Text('my data'), Text(dat)],
      ),
    );
  }
}
