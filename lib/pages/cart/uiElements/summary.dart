import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/ui.dart';
import 'dashDivider.dart';

class CartSummary extends StatelessWidget {
  final double subTotal;
  final double deliveryFee;
  final double discount;
  final VoidCallback onCheckout;

  const CartSummary({
    super.key,
    required this.subTotal,
    required this.deliveryFee,
    required this.discount,
    required this.onCheckout,
  });

  String _money(double value) => "\$${value.toStringAsFixed(2)}";

  @override
  Widget build(BuildContext context) {
    final double total = subTotal + deliveryFee - discount;

    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SummaryRow(label: 'Sub-total', value: _money(subTotal)),
            SizedBox(height: 12),
            _SummaryRow(label: 'Delivery Fee', value: _money(deliveryFee)),
            SizedBox(height: 12),
            _SummaryRow(label: 'Discount', value: "-${_money(discount)}"),
            SizedBox(height: 12),
            DashedDivider(color: Coloring().n200),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: Fonts().bodyXLargeBold(color: Coloring().n950)),
                Text(
                  _money(total),
                  style: Fonts().bodyXLargeBold(color: Coloring().n950),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: onCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Coloring().p500,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Go To Checkout',
                  style: Fonts().bodyXLargeBold(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Fonts().bodyLargeMedium(color: Coloring().n600)),
        Text(value, style: Fonts().bodyLargeMedium(color: Coloring().n950)),
      ],
    );
  }
}

