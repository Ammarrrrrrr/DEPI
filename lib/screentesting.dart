import 'package:flutter/material.dart';

class testing extends StatelessWidget {
  const testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('testing'),
      ),
      body: const Center(
        child: Text('testing Screen'),
      ),
    );
  }
}
