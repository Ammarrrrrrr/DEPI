import 'package:flutter/material.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/controller/pagenavigaterprovider.dart';
import 'package:pharmacy_system/pages/mainpage/controller/notyficationprovider.dart';
import 'package:pharmacy_system/pages/mainpage/homeui.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/HomeScreen.dart';
import 'package:pharmacy_system/pages/mainpage/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/SubScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeNotifier()),
    ChangeNotifierProvider(create: (context) => PagenavigatorNotifier()),
    ChangeNotifierProvider(create: (context) => Notyficationprovider()),
  ], child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor:  Coloring().p100,
        scaffoldBackgroundColor:  Coloring().p0,
        textTheme: TextTheme(bodyMedium: TextStyle(color:  Coloring().
        p900)),
        colorScheme: ColorScheme.light(
          primary:  Coloring().
          p900,
          background:  Coloring().p100,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor:  Coloring().p100,
        scaffoldBackgroundColor:  Coloring().p950,
        textTheme: TextTheme(bodyMedium: TextStyle(color:  Coloring().p0)),
        colorScheme: ColorScheme.dark(
          primary:  Coloring().p0,
          background:  Coloring().p100,
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Homescreen(),
      //   '/SubScreen': (context) => const SubScreen(),
      // },
      home: const MainPage(),
    );
  }
}
