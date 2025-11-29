import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'show rootBundle;
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/admin/admin_ui.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  final String pageName;
  const CustomAppbar({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedItemsProvider>(context);
    final store = Provider.of<StoreService>(context);
    return 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Icon(Icons.chevron_left, size: 30),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          //will remove this cause it's just for testing provider
          onPressed: () async {
            savedProvider.addProductsManually();
          },
          child: Text(
            pageName,
            style: TextStyle(fontSize: 24),
          ), // only will leave this
        ),
        InkWell(
          child: Icon(Icons.admin_panel_settings, size: 30),
          onTap: () {
            context.push(AdminUi());
            // ScaffoldMessenger.of(
            //   context,
            // ).showSnackBar(SnackBar(content: Text("Go to notifications page")));
          },
        ),
      ],
    );
  }
}

/**
 * all you have to do is put this code in your Scaffold:
  appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppbar(pageName: "Put your page name here"),
      ),
 */
