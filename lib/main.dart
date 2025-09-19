import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/account/account.dart';
import 'package:pharmacy_system/pages/mainpage/HomeScreen.dart';
import 'package:pharmacy_system/pages/mainpage/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/profile/profile.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:pharmacy_system/pages/saved-items/saved_items.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/SubScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeNotifier()),
    ChangeNotifierProvider(create: (context) => SavedItemsProvider()),
  ], child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/SavedPage',
      routes: {
        '/': (context) => const Homescreen(),
        '/SubScreen': (context) => const SubScreen(),
        '/SavedPage': (context) => SavedItems(),
        "/Account" : (context) =>  Account(),
        '/Profile' : (context) =>  Profile()
      },
    );
  }
}
