import 'package:flutter/material.dart';

class Notyficationprovider extends ChangeNotifier {
bool havenotyfication=true;
int notynum=4;
void changenotyfication(){
  havenotyfication=!havenotyfication;
  notifyListeners();
}
}