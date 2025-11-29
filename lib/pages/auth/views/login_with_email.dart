import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/pages/admin/admin_ui.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/auth/views/signup_with_email.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_botton.dart';
import 'package:pharmacy_system/pages/auth/widgets/app_field.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:pharmacy_system/services/auth.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class LoginWithEmail extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreService _storeService = Provider.of<StoreService>(context);
    final saved = Provider.of<SavedItemsProvider>(context);
    final cart = Provider.of<CartProvider>(context);
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
                AppBotton(
                  text: "Login",
                  GoToPage: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text;

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                    if (!emailRegex.hasMatch(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a valid email address'),
                        ),
                      );
                      return;
                    }
                    try {
                      if(email == "ad@ad.ad" && password == "admin") {
                        context.push(AdminUi());
                        return;
                      }else{
                      final user = await _authService.signinEmailPass(
                        email,
                        password,
                      );
                      if (user == null) {
                        log('signin fail from firebase');
                      } else {
                        // context.push(MainPage());
                        // _storeService.getMyUser(user.email??"");           forgot to type await ????????
                        log("user signin successfully ${user.email}");
                        await _storeService.getMyUser(
                          user.email ?? "",
                        ); // ------------------------------ most important line
                        if (_storeService.productList.isEmpty)
                          await _storeService.getProducts();
                        saved.productsIDs = _storeService.currentUser.saved;
                        cart.productsIDs = _storeService.currentUser.cart;
                        saved.removeAllProducts();
                        cart.removeAllProducts();
                        _storeService.productList.sort(
                          (a, b) => a.productId.compareTo(b.productId),
                        );
                        saved.productsIDs.sort();
                        cart.productsIDs.sort();
                        int j = 0;
                        for (
                          var i = 0;
                          i < _storeService.productList.length &&
                              j < saved.productsIDs.length;
                          i++
                        ) {
                          if (_storeService.productList[i].productId ==
                              saved.productsIDs[j]) {
                            saved.addProduct(_storeService.productList[i]);
                            j++;
                          }
                        }
                        j = 0;
                        for (
                          var i = 0;
                          i < _storeService.productList.length &&
                              j < cart.productsIDs.length;
                          i++
                        ) {
                          if (_storeService.productList[i].productId ==
                              cart.productsIDs[j]) {
                            cart.addProduct(_storeService.productList[i]);
                            j++;
                          }
                        }
                        log(saved.productsIDs.toString());
                        // after logging in we will have : sorted products in _storeService and SavedItemsProvider.projuctList
                        log(
                          "current user: ${_storeService.currentUser.toString()}",
                        );
                        context.push(MainPage());
                      }
                      }
                    } catch (e) {
                      log('signin error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('signin failed. Please try again.'),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 50),
                Center(
                  child: Row(
                    children: [
                      Text(
                        "Don’t have any account yet ?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffCECDD4),
                          fontFamily: "openSansM",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupWithEmail()),
                          );
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff323135),
                            fontFamily: "openSansM",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
