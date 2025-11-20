import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/images.dart';
import '../../../const/ui.dart';
import 'cartItemControl.dart';
import '../model/cartModel.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final String resolvedPath = (item.imageUrl.isNotEmpty)
        ? item.imageUrl
        : Images().onBoarding1;

    final ImageProvider imageProvider = resolvedPath.startsWith('http')
        ? NetworkImage(resolvedPath)
        : AssetImage(resolvedPath);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Coloring().n100)),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: imageProvider,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Fonts().heading5(color: Coloring().n950),
                ),
                SizedBox(height: 6),
                Text(
                  "\$${item.price.toStringAsFixed(2)}",
                  style: Fonts().heading6(color: Coloring().n950),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          CartItemControl(
            quantity: item.quantity,
            onQuantityChanged: onQuantityChanged,
          ),
        ],
      ),
    );
  }
}
