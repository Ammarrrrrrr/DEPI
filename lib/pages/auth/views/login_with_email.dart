import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_botton.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_field.dart';
import 'package:pharmacy_system/services/auth.dart';
import 'package:pharmacy_system/services/store.dart';

class LoginWithEmail extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final StoreService _storeService = StoreService();
  LoginWithEmail({super.key});

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
                  controller: emailController,
                  title: "Email",
                  hint: "Enter your email",
                  isPass: false,
                ),
                SizedBox(height: 15),
                AppField(
                  controller: passwordController,
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
                AppBotton(text: "Login", GoToPage: () async{
                  final email = emailController.text.trim();
                  final password = passwordController.text;

                  if (email.isEmpty || password.isEmpty ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegex.hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid email address')),
                    );
                    return;
                  }
                  try {
                    final user = await _authService.signinEmailPass(email, password);
                    if(user == null){
                      log('signin fail from firebase');
                    }
                    else{
                      // context.push(MainPage());
                      _storeService.getMyUser(user.email);
                      log("user signin successfully ${user.uid}");
                    }
                  } catch (e) {
                    log('signin error: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('signin failed. Please try again.')),
                    );
                  }
                  context.push(MainPage());
                  }),
                //SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
