import 'package:flutter/material.dart';

class Coloring {
  //Primary Colors
  final p50 = Color(0xffebefff);
  final p100 = Color(0xffdae2ff);
  final p200 = Color(0xffbcc8ff);
  final p300 = Color(0xff94a3ff);
  final p400 = Color(0xff6a70ff);
  final p500 = Color(0xff4f48ff);
  final p600 = Color(0xff4027ff);
  final p700 = Color(0xff452ce8);
  final p800 = Color(0xff2c1ab9);
  final p900 = Color(0xff291e91);
  final p950 = Color(0xff1a1254);

  //Neutral Colors
  final n50 = Color(0xfffbfbfc);
  final n100 = Color(0xffeeeef1);
  final n200 = Color(0xffe0e0e5);
  final n300 = Color(0xffcecdd4);
  final n400 = Color(0xffc2c1c9);
  final n500 = Color(0xffa7a5af);
  final n600 = Color(0xff938f9c);
  final n700 = Color(0xff7f7b87);
  final n800 = Color(0xff68656e);
  final n900 = Color(0xff57545b);
  final n950 = Color(0xff323135);

  //Alert Colors
  final r400 = Color(0xffff6979);
  final r500 = Color(0xfffe354e);
  final r600 = Color(0xffde1135);

  final g500 = Color(0xff18cf6d);
  final g600 = Color(0xff0dac57);
  final g700 = Color(0xff0e8345);

  final y200 = Color(0xfffae38d);
  final y300 = Color(0xfff8cf51);
  final y400 = Color(0xfff6bc2f);
}

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

class Images{
  final onBoarding1 = "lib/assets/images/Onboarding1.png";
}