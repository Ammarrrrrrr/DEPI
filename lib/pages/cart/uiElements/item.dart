import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

import '../../../const/colors.dart';
import '../../../const/images.dart';
import '../../../const/ui.dart';
// import 'cartItemControl.dart';
import '../model/cartModel.dart';

class CartItemTile extends StatelessWidget {
  final Product item;
  final ValueChanged<int> onQuantityChanged;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreService>(context);
    final cart = Provider.of<CartProvider>(context);
    final String resolvedPath = (item.imagePath.isNotEmpty)
        ? item.imagePath
        : Images().onBoarding1;

    final ImageProvider imageProvider = resolvedPath.startsWith('http')
        ? NetworkImage(resolvedPath)
        : AssetImage(resolvedPath);

    return Container(
      decoration: BoxDecoration(
        color: Coloring().p0,
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
                  item.title,
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
          InkWell(
            onTap: ()async{
              store.currentUser.cart.remove(item.productId);
              await store.saveUpdateCustomer(store.currentUser);
              cart.removeProduct(item);
              },
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
