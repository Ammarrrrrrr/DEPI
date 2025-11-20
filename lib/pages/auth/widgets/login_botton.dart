import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginBotton extends StatelessWidget {
  const LoginBotton({super.key, required this.text, required this.iconPath});
  final String text;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 340,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDAE2FF), width: 2.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 7,
        children: [
          SvgPicture.asset(iconPath),
          Text(
            "${text}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff323135),
              fontFamily: "openSansM",
            ),
          ),
        ],
      ),
    );
  }
}
