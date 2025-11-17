import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/controller/pagenavigaterprovider.dart';
import 'package:pharmacy_system/pages/mainpage/homeui.dart';
import 'package:provider/provider.dart';
    
class MainPage extends StatelessWidget {

  const MainPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final pro =Provider.of<PagenavigatorNotifier>(context);
    const List<Widget> _widgetOptions = <Widget>[Home()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pro.iconindex,
        selectedItemColor: Coloring().p500,
        unselectedItemColor: Colors.grey,
        iconSize: 25,
        onTap: (value) => pro.changeindex(value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline,),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,),
            label: 'Account',
          ),
        ],
      ),
      body: _widgetOptions[pro.pageindex],
    );
  }
}