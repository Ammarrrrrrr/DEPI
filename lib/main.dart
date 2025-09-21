import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/cart/cart.dart';
import 'package:pharmacy_system/pages/onBoarding/HomeScreen.dart';
import 'package:pharmacy_system/globalElements/bottomBar.dart';
import 'package:pharmacy_system/globalElements/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/subScreen-testonly/SubScreen.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_system/pages/cart/model/cartModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeNotifier())],
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
      initialRoute: '/',
      routes: {
        '/': (context) => MainRoot(initialCart: sampleCart),
        '/Cart': (context) => const Cart(cartItems: []),
      },
    );
  }
}
