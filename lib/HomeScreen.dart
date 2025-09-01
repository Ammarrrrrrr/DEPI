import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homescreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("this is the main screen , this screen is statefull",style: TextStyle(fontSize: 30),),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SubScreen');
              },
              child: const Text("Go to SubScreen"),
            ),
            
          ],
        ),
      ),
    );
  }
}
