import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/custom-widgets/heart_botton.dart';

// ignore: must_be_immutable
class ContainerItem extends StatelessWidget {
  Coloring coloring = Coloring();
  final Product product;

  ContainerItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 180, // fixed width for each item
      // height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(height: 180,image: NetworkImage(product.imagePath)),
              Text(product.title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),maxLines: 2,),
              Text(
                    "\$${product.price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
            ],
          ),
          Positioned(
                top: 0,
                right: 0,
                child: HeartButton(product: product),
              ),
        ],
      ),
    );
  }
}
