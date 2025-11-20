import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  final String pageName;
  const CustomAppbar({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedItemsProvider>(context);
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Icon(Icons.chevron_left, size: 30),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(//will remove this cause it's just for testing provider
                onPressed: () {
                  savedProvider.addProductsManually();
                },
                child: 
                Text(pageName, style: TextStyle(fontSize: 24)),// only will leave this
              ),
              InkWell(
                child: Icon(Icons.notifications_none, size: 30),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Go to notifications page")),
                  );
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