import 'package:flutter/material.dart';

class stfulltesting extends StatefulWidget {
  const stfulltesting({super.key});

  @override
  State<stfulltesting> createState() => _stfulltestingState();
}

class _stfulltestingState extends State<stfulltesting> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('stfulltesting')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => counter++),
              child: const Text('Increase'),
            ),
          ],
        ),
      ),
    );
  }
}
