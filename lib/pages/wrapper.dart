// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/model/model.dart';
import 'package:pharmacy_system/pages/auth/views/home_screen.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final  _storeService = Provider.of<StoreService>(context);
    final user = Provider.of<User?>(context);//custemer
    log("wrapper listening user: $user");
    // ignore: unnecessary_null_comparison
    // if(user == null){}
    // else if(!user.isAnonymous) _storeService.getMyUser(user);

    // _storeService.getProducts();
    // log(  "user: id:${user?.uid} email:${user?.email} name:${user?.name} saved:${user?.saved} cart:${user?.cart}");
    if(user == null) return HomeScreen();
    else{
      final result = _storeService.getMyUser(user.email!);
      // if(result == null) _storeService.saveUpdateCustomer(user);
      // log("user: id:${user.uid} email:${user.email} name:${user.name} saved:${user.saved} cart:${user.cart}");
      return MainPage();
      }
  }
}

// in this class we listen to the authentication changes and 
// go to pages based on that: 

// if the user if logged in he will go home pages
// if not he will go to authentiacte pages
