import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';

class HeartButton extends StatelessWidget {
  final Product product;
  const HeartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedItemsProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => _HeartState(),
      child: Consumer<_HeartState>(
        builder: (context, heart, child) {
          return InkWell(
            onTap: (){savedProvider.removeProduct(product);},
            child: Icon(
              heart.selected ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}

class _HeartState extends ChangeNotifier {
  bool selected = true;

  void toggle() {
    selected = !selected;
    notifyListeners();
  }
}
