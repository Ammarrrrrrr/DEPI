import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/auth/views/login_with_email.dart';

class PagenavigatorNotifier extends ChangeNotifier {
  int pageindex = 0;
  int iconindex = 0;
  void changeindex(int index, BuildContext context) {
    this.iconindex = index;
    this.pageindex = index;
    // log(" $pageindex");
    if (index == 3) {
      this.iconindex = 0;
      this.pageindex = 0;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginWithEmail()),
      );
    }

    notifyListeners();
  }
}
