import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/views/login_with_email.dart';
import 'package:pharmacy_system/pages/auth/views/signup_with_email.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_botton.dart';
import 'package:pharmacy_system/pages/auth/widgets/login_botton.dart';

// ignore: must_be_immutable
class LoginSignupPage extends StatelessWidget {
  LoginSignupPage({super.key, required this.isLogin});
  final bool isLogin;
  late String text = "";
  Widget build(BuildContext context) {
    isLogin ? text = "login" : text = "Signup";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$text to ShopZen",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff323135),
                  fontFamily: "openSansSemi",
                ),
              ),
              SizedBox(height: 50),
              LoginBotton(
                text: "$text with Google",
                iconPath: "assets/icons/google_icon.svg",
              ),
              SizedBox(height: 16),
              LoginBotton(
                text: "$text with Apple",
                iconPath: "assets/icons/apple_icon.svg",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Divider(color: Color(0xffCECDD4), thickness: 1.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: Color(0xff938F9C),
                          fontSize: 20,
                          fontFamily: "openSansM",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xffCECDD4), thickness: 1.5),
                    ),
                  ],
                ),
              ),
              AppBotton(
                text: "$text with Email",
                GoToPage: () {
                  isLogin
                      ? context.push(LoginWithEmail())
                      : context.push(SignupWithEmail());
                },
              ),
              SizedBox(height: 150),
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLogin
                      ? Text(
                          "Don’t have any account yet ?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffCECDD4),
                            fontFamily: "openSansM",
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "Do you have any account ?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffCECDD4),
                            fontFamily: "openSansM",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xff452CE8), width: 2),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 0),
                      child: isLogin
                          ? Text(
                              'Signup',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff452CE8),
                                fontFamily: "openSansM",
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff452CE8),
                                fontFamily: "openSansM",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                    onTap: () {
                      isLogin
                          ? context.push(SignupWithEmail())
                          : context.push(LoginWithEmail());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
