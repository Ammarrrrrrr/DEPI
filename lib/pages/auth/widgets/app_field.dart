import 'package:flutter/material.dart';

class AppField extends StatefulWidget {
  const AppField({
    super.key,
    required this.title,
    required this.hint,
    required this.isPass, 
    required this.controller,
  });
  final String title;
  final String hint;
  final bool isPass;
  final TextEditingController controller;
  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  bool isVisible = true;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xff323135),
              fontFamily: "openSansM",
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 55,
            width: 340,
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isPass ? isVisible : false,
              decoration: InputDecoration(
                hint: Text(
                  widget.hint,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffA7A5AF),
                    fontFamily: "openSansM",
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffA7A5AF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffA7A5AF)),
                ),
                suffixIcon: widget.isPass
                    ? GestureDetector(
                        child: SizedBox(
                          height: 16,
                          width: 16,
                          child: isVisible
                              ? Image.asset("assets/pic/pass_invisible.png")
                              : Image.asset("assets/pic/pass_visible.png"),
                        ),
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      )
                    : null,
              ),
              cursorColor: Color(0xff57545B),
            ),
          ),
        ],
      ),
    );
  }
}
