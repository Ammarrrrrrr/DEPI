import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/mainpage/HomeScreen.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/SubScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Homescreen(),
          '/SubScreen': (context) => const SubScreen(),
        },
    );

  }
}