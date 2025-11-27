import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
int index = 0;
void changeindex() {
  index++;
  notifyListeners();
}
}