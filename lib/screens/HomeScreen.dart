import 'package:flutter/material.dart';
import 'package:pharmacy_system/ui/ui.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 108),
            Image.asset(Images().onBoarding1, width: 362, height: 359.91),
            SizedBox(height: 50),
            Text(
              "Welcome to PharmaPharma",
              textAlign: TextAlign.center,
              style: Fonts().heading3(color: Coloring().n950),
            ),
            SizedBox(height: 8),
            Text(
              "Your one-stop destination for hassle-free online shopping",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Coloring().n800,
              ),
            ),
            SizedBox(height: 65),
            SizedBox(
              width: 395,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/SubScreen");
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
                  "Get Started1",
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
