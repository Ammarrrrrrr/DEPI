// import 'package:flutter/material.dart';

class Product {
  final String imagePath;       // URL or asset path
  final String title;       // product name
  final double currentPrice;
  final double oldPrice;
  final double rating;      // e.g. 4.5
  final int ratingCount;    // e.g. 120 reviews
  
  // Image image;

  Product({
    required this.imagePath,
    required this.title,
    required this.currentPrice,
    required this.oldPrice,
    required this.rating,
    required this.ratingCount,
  });
}
