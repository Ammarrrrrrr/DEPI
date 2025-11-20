import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_botton.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_field.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login with Email",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff323135),
                    fontFamily: "openSansSemi",
                  ),
                ),
                SizedBox(height: 50),
                AppField(
                  title: "Email",
                  hint: "Enter your email",
                  isPass: false,
                ),
                SizedBox(height: 15),
                AppField(
                  title: "Password",
                  hint: "Enter your password",
                  isPass: true,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: AlignmentGeometry.directional(.9, 0),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff323135),
                      fontFamily: "openSansM",
                    ),
                  ),
                ),
                SizedBox(height: 50),
                AppBotton(text: "Login", GoToPage: () {}),
                //SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
