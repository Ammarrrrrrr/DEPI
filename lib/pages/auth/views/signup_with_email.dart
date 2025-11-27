import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_botton.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_field.dart';
import 'package:pharmacy_system/services/auth.dart';
import 'package:pharmacy_system/services/store.dart';

class SignupWithEmail extends StatefulWidget {
  @override
  State<SignupWithEmail> createState() => _SignupWithEmailState();
}

class _SignupWithEmailState extends State<SignupWithEmail> {
  bool activeRec = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final AuthService _authService = AuthService();
  final StoreService _storeService = StoreService();
  bool isVisible = false;


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
                  "Signup with Email",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff323135),
                    fontFamily: "openSansB",
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
                SizedBox(height: 15),
                AppField(
                  controller: confirmController,
                  title: "Confirm Password",
                  hint: "Enter your password",
                  isPass: true,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: activeRec
                            ? SvgPicture.asset("assets/icons/active_rec.svg")
                            : SvgPicture.asset("assets/icons/Rectangle.svg"),
                        onTap: () {
                          setState(() {
                            activeRec = !activeRec;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Agree with ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff323135),
                          fontFamily: "openSansM",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff452CE8),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          "Terms & Condition",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff452CE8),
                            fontFamily: "openSansM",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                AppBotton(text: "Signup", GoToPage: () async{
                  final email = emailController.text.trim();
                  final password = passwordController.text;
                  final confirm = confirmController.text;

                  if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
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

                  if (password != confirm) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Passwords do not match')),
                    );
                    return;
                  }

                  try {
                    final user = await _authService.registerEmailPass(email, password);
                    if(user == null){
                      log('Signup fail from firebase');
                    }
                    else{
                      _storeService.saveUpdateCustomer(user);
                      // context.push(MainPage());
                      log("user singup successfully ${user.uid}");
                    }
                  } catch (e) {
                    log('Signup error: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signup failed. Please try again.')),
                    );
                  }
                  // log("email: ${emailController.text}");
                  // _authService.registerEmailPass(emailController.text, passwordController.text);
                  // context.push(MainPage());
                }),
                // AppBotton(text: "Login", GoToPage: () {context.push(MainPage()); 
                // _authService.signInAnon();
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
