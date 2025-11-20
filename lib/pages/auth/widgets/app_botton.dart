import 'package:flutter/material.dart';

class AppBotton extends StatelessWidget {
  const AppBotton({super.key, required this.text, required this.GoToPage});
  final String text;
  final void Function() GoToPage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 55,
        width: 340,
        decoration: BoxDecoration(
          color: Color(0xff452CE8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "${text}",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "openSansSemi",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: GoToPage,
    );
  }
}
