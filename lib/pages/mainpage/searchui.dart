import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/globalElements/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/mainpage/productui.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class Searchui extends StatelessWidget {
  const Searchui({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeNotifier>(context);
    final store = Provider.of<StoreService>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Product Search")),
      body: Column(
        children: [
          // 🔍 Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            TextFormField(
              onChanged: (value) => pro.searchProduct(value, store.productList),
                  // controller: _x,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Coloring().n500),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Coloring().p700),
                    ),

                    labelText: 'Find your favorite items',
                    labelStyle: TextStyle(color: Coloring().n500),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // Action for the close icon
                      },
                      child: Icon(
                        Icons.close,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        size: 21,
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        // Action for the search icon
                      },
                      child: Icon(
                        Icons.search,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        size: 25,
                      ),
                    ),
                    filled: true,
                    fillColor: Coloring().n50,
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // if (!emailRegex.hasMatch(value)) {
                    //   return 'Please enter a valid email';
                    // }
                    return null;
                  },
                ),
          ),

          // 📦 List of Filtered Products
          Expanded(
            child: ListView.builder(
              itemCount: pro.filteredProducts.length,
              itemBuilder: (context, index) {
                final p = pro.filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Productui(product: p),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(p.title),
                    subtitle: Text("${p.price} USD"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
