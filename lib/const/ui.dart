import 'package:flutter/material.dart';
import 'colors.dart';

class Fonts {
  final Coloring _colors;

  Fonts({Coloring? colors}) : _colors = colors ?? Coloring();

  // Headings
  TextStyle heading1({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 48,
    color: color,
  );

  TextStyle heading2({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 40,
    color: color,
  );

  TextStyle heading3({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: color,
  );

  TextStyle heading4({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: color,
  );

  TextStyle heading5({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: color,
  );

  TextStyle heading6({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: color,
  );

  // Body XL
  TextStyle bodyXLargeBold({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: color,
  );

  TextStyle bodyXLargeMedium({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: color,
  );

  TextStyle bodyXLargeRegular({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: color,
  );

  // Body Large
  TextStyle bodyLargeBold({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: color,
  );

  TextStyle bodyLargeMedium({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: color,
  );

  TextStyle bodyLargeRegular({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: color,
  );

  // Body Medium
  TextStyle bodyMediumBold({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: color,
  );

  TextStyle bodyMediumMedium({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: color,
  );

  TextStyle bodyMediumRegular({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: color,
  );

  // Body Small
  TextStyle bodySmallBold({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: color,
  );

  TextStyle bodySmallMedium({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: color,
  );

  TextStyle bodySmallRegular({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: color,
  );

  // Body XSmall
  TextStyle bodyXSmallBold({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w700,
    fontSize: 10,
    color: color,
  );

  TextStyle bodyXSmallMedium({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: color,
  );

  TextStyle bodyXSmallRegular({Color? color}) => TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: color,
  );
}

