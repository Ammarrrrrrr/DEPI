import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 8), () {
      context.push(HomeScreen());
    });
    return Scaffold(
      backgroundColor: Color(0xff452CE8),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideInLeft(
              child: Image.asset(
                "assets/pic/splash_icon.png",
                width: 70,
                height: 70,
              ),
              duration: Duration(seconds: 3),
            ),
            SizedBox(width: 18),
            SlideInRight(
              child: Text(
                "ShopZen",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "openSansB",
                ),
              ),
              duration: Duration(seconds: 3),
            ),
          ],
        ),
      ),
    );
  }
}
