import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'show rootBundle;
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/services/store.dart';

class SavedItemsProvider extends ChangeNotifier {
  final List<Product> _products = [];
  List<String> productsIDs = [];
  List<Product> get products => _products;
  StoreService storeService = StoreService();

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    productsIDs.remove(product.productId);
    _products.remove(product);
    notifyListeners();
  }
  void removeAllProducts() {
    _products.clear();
    notifyListeners();
  }

  Future<void> addProductsManually() async{
  //   final rawData = await rootBundle.loadString('assets/Medicine_Details.csv');

  // List<List<String>> rows = rawData
  //     .split('\n')
  //     .map((line) => line.split(','))
  //     .toList();
  //     log(rows[1].toString());
  // for (var i = 1; i < 41; i++) {
  //     String url = rows[i][4]+rows[i][5]+rows[i][6]+rows[i][7]+rows[i][7]+rows[i][8]+rows[i][9]+rows[i][10]+rows[i][11];
  //     // log(url.substring(1,url.length));

  //   _products.add(Product(productId: i.toString(), //"hhhhh"
  //               imagePath: url.substring(1,url.length-1), 
  //               title: rows[i].elementAt(0), 
  //               price: Random().nextInt(200), 
  //               description: "uses: ${rows[i].elementAt(2)}, side effects: ${rows[i].elementAt(3)}"));
  // }
  // for (var i = 0; i < _products.length; i++) {
  //   storeService.deleteProduct(_products[i].productId+(_products[i].title.split(' ')[0]));
  // }

  //   _products.add(
  //     Product(
  //       imagePath: "assets/images/Onboarding1.png",
  //       title: "testing a very lage title because i want to see what will happen",
  //       currentPrice: 40,
  //       oldPrice: 10,
  //       rating: 4,
  //       ratingCount: 50,
  //     ),
  //   );
  //   _products.add(
  //     Product(
  //       imagePath: "assets/images/keyboard.jpg",
  //       title: "Mechanical Gaming Keyboard",
  //       currentPrice: 40,
  //       oldPrice: 60,
  //       rating: 4.5,
  //       ratingCount: 120,
  //     ),
  //   );
  //   _products.add(
  //     Product(
  //       imagePath: "assets/images/funny.jpg",
  //       title: "title",
  //       currentPrice: 50,
  //       oldPrice: 60,
  //       rating: 4,
  //       ratingCount: 50,
  //     ),
  //   );
  //   notifyListeners();
  }
// user - > saved : 6,2,8,3
// user - > saved : 2,3,6,8 

// list -> 1 ,2 ,3 

  // you can also have fetch/load methods here
}
