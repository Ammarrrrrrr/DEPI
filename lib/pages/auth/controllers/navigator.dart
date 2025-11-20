import 'package:flutter/material.dart';

extension EasyNavigator on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
  }
}
