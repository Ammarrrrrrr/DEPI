import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/pages/cart/uiElements/item.dart';
import 'package:pharmacy_system/pages/cart/uiElements/summary.dart';
import 'package:pharmacy_system/pages/cart/model/cartModel.dart';

class Cart extends StatefulWidget {
  final List<CartItem> cartItems;

  const Cart({super.key, required this.cartItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late List<CartItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List<CartItem>.from(widget.cartItems);
  }

  void _updateItemQuantity(String id, int newQty) {
    setState(() {
      _items = _items
          .map(
            (it) => it.id == id
                ? CartItem(
                    id: it.id,
                    name: it.name,
                    imageUrl: it.imageUrl,
                    quantity: newQty,
                    price: it.price,
                  )
                : it,
          )
          .toList();
    });
  }

  void _removeItem(String id) {
    setState(() {
      _items.removeWhere((it) => it.id == id);
    });
  }

  Widget _buildSummaryBar(BuildContext context) {
    final double subTotal = _items.fold(
      0.0,
      (sum, it) => sum + (it.price * it.quantity),
    );
    final double delivery = 20.00;
    final double discount = 10.00;

    return CartSummary(
      subTotal: subTotal,
      deliveryFee: delivery,
      discount: discount,
      onCheckout: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Proceeding to checkout...')));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Coloring().n950,
              ),
            ),
            Text("My Cart", style: Fonts().heading4(color: Coloring().n950)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: Coloring().n950),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _items.isEmpty
            ? Center(
                child: Text(
                  "Your cart is empty",
                  style: Fonts().heading5(color: Coloring().n950),
                ),
              )
            : ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (context, index) => SizedBox(height: 0),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return KeyedSubtree(
                    key: ValueKey(item.id),
                    child: CartItemTile(
                      item: item,
                      onQuantityChanged: (q) {
                        if (q == 0) {
                          _removeItem(item.id);
                        } else {
                          _updateItemQuantity(item.id, q);
                        }
                      },
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: (_buildSummaryBar(context)),
    );
  }
}
