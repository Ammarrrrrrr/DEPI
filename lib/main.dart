import 'package:flutter/material.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/controller/pagenavigaterprovider.dart';
import 'package:pharmacy_system/globalElements/controller/notyficationprovider.dart';
import 'package:pharmacy_system/pages/auth/views/splash_screen.dart';
// import 'package:pharmacy_system/pages/mainpage/controller/notyficationprovider.dart';
import 'package:pharmacy_system/pages/mainpage/homeui.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/HomeScreen.dart';
// import 'package:pharmacy_system/pages/mainpage/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/cart/cart.dart';
import 'package:pharmacy_system/pages/onBoarding/HomeScreen.dart'
    hide Homescreen;
import 'package:pharmacy_system/globalElements/bottomBar.dart';
import 'package:pharmacy_system/globalElements/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/account/account.dart';
// import 'package:pharmacy_system/pages/mainpage/HomeScreen.dart';
// import 'package:pharmacy_system/pages/mainpage/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/profile/profile.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:pharmacy_system/pages/saved-items/saved_items.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/SubScreen.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_system/pages/cart/model/cartModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeNotifier()),
        ChangeNotifierProvider(create: (context) => PagenavigatorNotifier()),
        ChangeNotifierProvider(create: (context) => Notyficationprovider()),
        ChangeNotifierProvider(create: (context) => SavedItemsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<CartItem> sampleCart = [
    CartItem(
      id: "1",
      name: "Paracetamol 500mg",
      imageUrl:
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=",
      quantity: 2,
      price: 4,
    ),
    CartItem(
      id: "2",
      name: "Vitamin C Tablets",
      imageUrl:
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=",
      quantity: 1,
      price: 5.0,
    ),
    CartItem(
      id: "3",
      name: "Vitamin C Tablets",
      imageUrl:
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=",
      quantity: 1,
      price: 5.0,
    ),
    CartItem(
      id: "4",
      name: "Vitamin C Tablets",
      imageUrl:
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=",
      quantity: 1,
      price: 5.0,
    ),
    CartItem(
      id: "5",
      name: "Vitamin C Tablets",
      imageUrl:
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=",
      quantity: 1,
      price: 5.0,
    ),
    CartItem(
      id: "6",
      name: "Vitamin C Tablets",
      imageUrl:
          "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=",
      quantity: 1,
      price: 5.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Coloring().p100,
        scaffoldBackgroundColor: Coloring().p0,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Coloring().p900)),
        colorScheme: ColorScheme.light(
          primary: Coloring().p900,
          background: Coloring().p100,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Coloring().p100,
        scaffoldBackgroundColor: Coloring().p950,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Coloring().p0)),
        colorScheme: ColorScheme.dark(
          primary: Coloring().p0,
          background: Coloring().p100,
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Homescreen(),
      //   '/SubScreen': (context) => const SubScreen(),
      // },
      // home: const Homescreen(),
      home: const SplashScreen(),
    );
  }
}
