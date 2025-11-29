import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/views/login_home.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_botton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/pic/on_bording.png",
                  height: 360,
                  width: 360,
                ),
              ),
              SizedBox(height: 35),
              Text(
                "Welcome to ShopZen",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff323135),
                  fontFamily: "openSansB",
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Text(
                  "Your one-stop destination for hassle-free online shopping",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xff68656E),
                    fontWeight: FontWeight.w600,
                    fontFamily: "openSansM",
                  ),
                ),
              ),
              SizedBox(height: 40),
              AppBotton(
                text: "Get Started",
                GoToPage: () {
                  context.push(LoginSignupPage(isLogin: false));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
