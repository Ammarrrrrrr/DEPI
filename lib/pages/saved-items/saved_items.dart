import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/pages/custom-widgets/container_item.dart';
import 'package:pharmacy_system/pages/custom-widgets/appbar_title.dart';
import 'package:pharmacy_system/pages/custom-widgets/empty_saved.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';

// ignore: must_be_immutable
class SavedItems extends StatelessWidget {
  SavedItems({super.key});
  Coloring coloring = Coloring();

  @override
  Widget build(BuildContext context) {
    final items = context.watch<SavedItemsProvider>().products;

    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading: false,
          title: CustomAppbar(pageName: "Saved Items")),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.pushNamed(context,"/");
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [Icon(Icons.home, size: 30), Text("Home")],
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Don\'t go anywhere'),
      //               duration: Duration(seconds: 1), // how long it shows
      //             ),
      //           );
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.favorite_border, color: coloring.p700, size: 30),
      //             Text("Saved"),
      //           ],
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Go to Cart page'),
      //               duration: Duration(seconds: 1), // how long it shows
      //             ),
      //           );
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.shopping_cart_outlined, size: 30),
      //             Text("Cart"),
      //           ],
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.pushNamed(context,"/Account");
      //         },
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.person_outline, size: 30),
      //             Text("Account"),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: items.isEmpty
          ? EmptySaved()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${items.length} Items",
                      style: TextStyle(fontSize: 20),
                    ),
                    Wrap(
                      spacing: 8.0, // horizontal gap between items
                      runSpacing: 8.0, // vertical gap between rows
                      children: items.map((item) {
                        return ContainerItem(product: item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
