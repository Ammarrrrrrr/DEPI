import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/custom-widgets/heart_botton.dart';

// ignore: must_be_immutable
class ContainerItem extends StatelessWidget {
  Coloring coloring = Coloring();
  final Product product;
  // String image;
  // String title;
  // double currentPrice;
  // double oldPrice;
  // double rating;
  // int ratingCount;

  ContainerItem({super.key, required this.product});
  // {
  //   image = product.imagePath;
  //   title = product.title;

  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // fixed width for each item
      // height: 240,
      decoration: BoxDecoration(
        // color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Image(image: AssetImage(product.imagePath)),
              Image(image: NetworkImage(product.imagePath)),
              Positioned(
                top: 10,
                right: 10,
                child: HeartButton(product: product),
              ),
            ],
          ),
          Text(product.title, style: TextStyle(fontSize: 22),maxLines: 3,),
          Row(
            spacing: 5,
            children: [
              // Text(
              //   "${product.description}".toString(),
              //   style: TextStyle(fontSize: 15),
              // ), 
              
              Text(
                "\$${product.price}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          // Row(
          //   spacing: 5,
          //   children: [
          //     Icon(Icons.stars, color: Color(0xffF6BC2F)),
          //     Text({product.rating}.toString()),
          //     Text("(${product.ratingCount})"),
          //   ],
          // ),
        ],
      ),
    );
  }
}
