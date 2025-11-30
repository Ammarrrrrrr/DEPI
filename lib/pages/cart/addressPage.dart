import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/pages/cart/uiElements/summary.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class Addresspage extends StatelessWidget {
  const Addresspage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreService>(context); 
    final _addressController = TextEditingController();
    final cartItems = Provider.of<CartProvider>(context).products;
    return Scaffold(
      appBar: AppBar(title: Text("Finish Order"),),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),
      child: TextField(
              controller: _addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your delivery address',
              ),
              maxLines: 4,
            ),),
      bottomNavigationBar: CartSummary(
      total: cartItems.fold<double>(0.0,(sum,item) => sum + item.price),
      onCheckout: () async{
        if(_addressController.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Enter Address')),
          );
        }else if(cartItems.length<1){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Can\'t order with empty cart')),
          );
        }
        else{
          // add order into firestore
          await store.saveUpdateOrder(store.currentUser, _addressController.text,false,"");
          store.currentUser.cart.clear();
          await store.saveUpdateCustomer(store.currentUser);
          cartItems.clear();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Order Finished')),
          );
          Navigator.pop(context);
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