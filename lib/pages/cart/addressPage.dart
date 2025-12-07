import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/MainPage.dart';
import 'package:pharmacy_system/controller/pagenavigaterprovider.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/pages/cart/uiElements/summary.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/const/colors.dart';

class Addresspage extends StatelessWidget {
  const Addresspage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreService>(context);
    final _addressController = TextEditingController();
    final _StreetController = TextEditingController();
    final _BuildingController = TextEditingController();
    final _AppartmentController = TextEditingController();
    final cartItems = Provider.of<CartProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD6EEF0),
        centerTitle: true,
        title: Text("Address", style: Fonts().heading4(color: Coloring().n950)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //SizedBox(width: 10,),
                  Text(
                    "Please Enter your Delivery Address",
                    style: Fonts().bodyXLargeMedium(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: _StreetController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Street',
                ),
                maxLines: 1,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _BuildingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Building',
                ),
                maxLines: 1,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _AppartmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Apartment',
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CartSummary(
        total: cartItems.fold<double>(0.0, (sum, item) => sum + item.price),
        onCheckout: () async {
          _addressController.text =
              "${_StreetController.text}, ${_BuildingController.text}, ${_AppartmentController.text}";

          if (_addressController.text.length < 10) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Please Enter Address')));
          } else if (cartItems.length < 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Can\'t order with empty cart')),
            );
          } else {
            // add order into firestore
            await store.saveUpdateOrder(
              store.currentUser,
              _addressController.text,
              false,
              "",
            );
            store.currentUser.cart.clear();
            await store.saveUpdateCustomer(store.currentUser);
            cartItems.clear();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Order Finished')));

            // Reset navigation to Home tab and go to MainPage
            Provider.of<PagenavigatorNotifier>(
              context,
              listen: false,
            ).changeindex(0, context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
              (route) => false,
            );
          }
        },
      ),
    );
  }
  // Widget _buildSummaryBar(BuildContext context, List<Product> cartItems,String address) {

  //   log("address: $address");
  //   int total = 0;
  //   cartItems.forEach((element) {
  //     total+=element.price;
  //   },);

  //   return CartSummary(
  //     total: total.toDouble(),
  //     onCheckout: () async{
  //       if(address.isEmpty){
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Please Enter Address')),
  //         );
  //       }else if(cartItems.length<1){
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Can\'t order with empty cart')),
  //         );
  //       }
  //       else{
  //         // add order into firestore
  //         await store.addOrder(store.currentUser, address);
  //         store.currentUser.cart.clear();
  //         await store.saveUpdateCustomer(store.currentUser);
  //         cartItems.clear();
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('Order Finished')),
  //         );
  //         Navigator.pop(context);
  //       }
  //     },
  //   );
  // }
}
