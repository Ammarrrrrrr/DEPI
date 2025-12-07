import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_system/const/ui.dart';

class Productui extends StatelessWidget {
  Product product;

  Productui({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreService>(context);
    final cartItems = Provider.of<CartProvider>(context);
    final saveditems = Provider.of<SavedItemsProvider>(context);
    bool inCart = cartItems.productsIDs.any(
      (Element) => Element == product.productId,
    );
    bool isSaved = saveditems.productsIDs.any(
      (element) => element == product.productId,
    );
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),

      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Product Details', style: Fonts().heading4()),
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () async {
                if (inCart) {
                  store.currentUser.cart.remove(product.productId);
                  await store.saveUpdateCustomer(store.currentUser);
                  cartItems.removeProduct(product);
                  log(
                    'removed product ${product.productId} from user cart(${store.currentUser.name})',
                  );
                  //ScaffoldMessenger.of(context).showSnackBar(
                  //  SnackBar(content: Text('Product removed from cart')),
                //  );
                } else {
                  store.currentUser.cart.add(product.productId);
                  await store.saveUpdateCustomer(store.currentUser);
                  cartItems.addProduct(product);
                  log(
                    'added product ${product.productId} from user cart(${store.currentUser.name})',
                  );
                  //ScaffoldMessenger.of(context).showSnackBar(
                   // SnackBar(content: Text('Product added to cart')),
                  //);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Coloring().p500,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                inCart ? 'Remove from Cart' : 'Add to Cart',
                style: Fonts().bodyXLargeBold(color: Colors.white),
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
            Stack(
              children: [
                Container(
                  width: 375,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Coloring().p0,
                  ),
                  child: Image(
                    width: 375,
                    height: 260,
                    //fit: BoxFit.cover,
                    image: NetworkImage(product.imagePath),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        if (isSaved) {
                          store.currentUser.saved.remove(product.productId);
                          await store.saveUpdateCustomer(store.currentUser);
                          saveditems.removeProduct(product);
                          log(
                            'removed saved from user(${store.currentUser.name}) :${product.productId}',
                          );
                        } else {
                          store.currentUser.saved.add(product.productId);
                          await store.saveUpdateCustomer(store.currentUser);
                          saveditems.addProduct(product);
                          log(
                            'added saved to user(${store.currentUser.name}) :${product.productId}',
                          );
                        }
                      },
                      child: Icon(
                        isSaved ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Text(product.title, style: Fonts().heading4(color: Colors.black)),

            Text(
              '\$${product.price}',
              style: Fonts().heading5(color: Colors.black),
            ),

            Text(
              'Product Details',
              style: Fonts().bodyLargeBold(color: Colors.black),
            ),

            Text(
              product.description,
              style: Fonts().bodyXLargeMedium(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
