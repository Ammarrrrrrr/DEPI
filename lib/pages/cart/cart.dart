import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/cart/addressPage.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/pages/cart/uiElements/item.dart';
import 'package:pharmacy_system/pages/cart/uiElements/summary.dart';
import 'package:pharmacy_system/pages/cart/model/cartModel.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  final List<CartItem> cartItems;
  Cart({super.key, required this.cartItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).products;

    log("cart length: " + cartItems.length.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("My Cart", style: Fonts().heading4(color: Coloring().n950)),
        //leading: IconButton(
        //  onPressed: () => Navigator.pop(context),
        //  icon: Icon(Icons.arrow_back_ios_new_outlined, color: Coloring().n950),
       // ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: cartItems.isEmpty
            ? Center(
                child: Text(
                  "Your cart is empty",
                  style: Fonts().heading5(color: Coloring().n950),
                ),
              )
            :
              // Text("products")
              ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 0),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return KeyedSubtree(
                    key: ValueKey(item.productId),
                    child: CartItemTile(
                      item: item,
                      onQuantityChanged: (q) {
                        // Handle quantity changes
                      },
                    ),
                  );
                },
              ),
      ),

      bottomNavigationBar: (_buildSummaryBar(context, cartItems)),
    );
  }

  Widget _buildSummaryBar(BuildContext context, List<Product> cartItems) {
    int total = 0;
    cartItems.forEach((element) {
      total += element.price;
    });

    return CartSummary(
      total: total.toDouble(),
      onCheckout: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Proceeding to checkout...')));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Addresspage()),
        );
      },
    );
  }
}
