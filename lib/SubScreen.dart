import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  const SubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('SubScreen Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),

      ),
    );
  }
}
