import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'show rootBundle;
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/services/store.dart';

class CartProvider extends ChangeNotifier {
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
}