import 'package:flutter/material.dart';

class SquaredIconButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const SquaredIconButton({
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: iconColor, size: 18),
      ),
    );
  }
}