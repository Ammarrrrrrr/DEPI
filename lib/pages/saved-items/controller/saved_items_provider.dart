import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/product.dart';

class SavedItemsProvider extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }
  void addProductsManually(){
    _products.add(
      Product(
        imagePath: "assets/images/Onboarding1.png",
        title: "testing a very lage title because i want to see what will happen",
        currentPrice: 40,
        oldPrice: 10,
        rating: 4,
        ratingCount: 50,
      ),
    );
    _products.add(
      Product(
        imagePath: "assets/images/keyboard.jpg",
        title: "Mechanical Gaming Keyboard",
        currentPrice: 40,
        oldPrice: 60,
        rating: 4.5,
        ratingCount: 120,
      ),
    );
    _products.add(
      Product(
        imagePath: "assets/images/funny.jpg",
        title: "title",
        currentPrice: 50,
        oldPrice: 60,
        rating: 4,
        ratingCount: 50,
      ),
    );
    notifyListeners();
  }

  // you can also have fetch/load methods here
}
