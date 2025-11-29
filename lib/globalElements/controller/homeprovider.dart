import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/product.dart';

class HomeNotifier extends ChangeNotifier {
int index = 0;
var filteredProducts=[];
void changeindex() {
  index++;
  notifyListeners();
}

void searchProduct(String query , List<Product> products) {
    final results = products.where((p) {
      return p.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    filteredProducts = results;
    notifyListeners();
  }

}