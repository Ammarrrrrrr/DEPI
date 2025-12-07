import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/const/images.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/views/login_with_email.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
                  width: 395,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(
                    //LoginSignupPage(isLogin: false)
                    LoginWithEmail(),
                    );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Coloring().p700),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 20,color: Color(0xffffffff)),
                    ),
                  ),
                ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 38),
              Image.asset(Images().onBoarding1, width: 362, height: 359.91),
              SizedBox(height: 50),
              Text(
                "Welcome to Pharmanet",
                textAlign: TextAlign.center,
                style: Fonts().heading3(color: Coloring().n950),
              ),
              SizedBox(height: 8),
              Text(
                "Your one-stop destination for Pharmanet online shopping",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: Coloring().n800,
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
