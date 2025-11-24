// import 'package:flutter/material.dart';

class Product {
  final String productId;
  final String imagePath;       // URL or asset path
  final String title;       // product name
  final String description;
  final int price;
  
  // Image image;

  Product({
    required this.productId,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
  });
}
