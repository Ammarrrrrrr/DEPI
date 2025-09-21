import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../../../const/ui.dart';
import 'squareButton.dart';

class CartItemControl extends StatefulWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const CartItemControl({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  State<CartItemControl> createState() => _CartItemControlState();
}

class _CartItemControlState extends State<CartItemControl> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

  @override
  void didUpdateWidget(covariant CartItemControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quantity != widget.quantity) {
      _quantity = widget.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Coloring();
    final fonts = Fonts();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SquaredIconButton(
          backgroundColor: colors.n100,
          icon: Icons.remove,
          iconColor: colors.n800,
          onTap: () {
            if (_quantity == 0) return;
            final int updated = _quantity - 1;
            setState(() => _quantity = updated);
            widget.onQuantityChanged(updated);
          },
        ),
        SizedBox(width: 12),
        Text(
          _quantity.toString(),
          style: fonts.bodyLargeMedium(color: colors.n950),
        ),
        SizedBox(width: 12),
        SquaredIconButton(
          backgroundColor: colors.p500,
          icon: Icons.add,
          iconColor: Colors.white,
          onTap: () {
            final int updated = _quantity + 1;
            setState(() => _quantity = updated);
            widget.onQuantityChanged(updated);
          },
        ),
      ],
    );
  }
}
