import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class Productui extends StatelessWidget {
  Product product;
  Productui({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreService>(context);
    final cartItems = Provider.of<CartProvider>(context);
    bool inCart = cartItems.productsIDs.any(
      (Element) => Element == product.productId,
    );
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () async {
            if (inCart) {
              store.currentUser.cart.remove(product.productId);
              await store.saveUpdateCustomer(store.currentUser);
              cartItems.removeProduct(product);
              log(
                'removed product ${product.productId} from user cart(${store.currentUser.name})',
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Product removed from cart'),),
              );
            } else {
              store.currentUser.cart.add(product.productId);
              await store.saveUpdateCustomer(store.currentUser);
              cartItems.addProduct(product);
              log(
                'added product ${product.productId} from user cart(${store.currentUser.name})',
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Product added to cart'),),
              );
            }
          },
          child: Container(
            //width: 95,
            height: 50,
            //alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Coloring().p400,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Image(
              // width: 270,
              height: 150,
              image: NetworkImage(
                '${product.imagePath}',

                //scale: .3,
              ),
            ),

            Text(
              '${product.title}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            Text(
              '\$${product.price}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            Text(
              'Product Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            Text(
              '${product.description}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
