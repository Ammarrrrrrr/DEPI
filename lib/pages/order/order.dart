import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/model.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class SingleOrder extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final List<String> productsIDs;
  final bool finished;
  final String date;
  const SingleOrder({
    super.key,
    required this.date,
    required this.name,
    required this.email,
    required this.address,
    required this.productsIDs,
    required this.finished,
  });

  // helper that finds products in the store by id (robust to different id field names)
  Future<List<Product>> _fetchProductsFromStore(StoreService store) async {
    final all = store.productList ?? [];
    final matched = all.where((p) {
      // try common id fields and compare as strings
      final pidCandidates = <String?>[
        p.productId?.toString(),
        p.productId?.toString(),
      ];
      return pidCandidates.any((c) => c != null && productsIDs.contains(c));
    }).toList();
    return matched;
  }

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<StoreService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD6EEF0),
        title: Text('Order Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(email, style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 6),
              Text(address, style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 16),
              Text(
                'Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              FutureBuilder<List<Product>>(
                future: _fetchProductsFromStore(_store),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final products = snapshot.data ?? [];
                  if (products.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text('No products found for this order.'),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    separatorBuilder: (_, __) => Divider(),
                    itemBuilder: (context, index) {
                      final p = products[index];
                      final title = (p.title);
                      final price = (p.price);
                      final imageUrl = (p.imagePath).toString();

                      return ListTile(
                        leading: (imageUrl.isNotEmpty)
                            ? Image.network(
                                imageUrl,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Icon(Icons.image),
                              )
                            : Container(
                                width: 56,
                                height: 56,
                                color: Colors.grey[200],
                                child: Icon(Icons.image),
                              ),
                        title: Text(title),
                        subtitle: Text('Price: \$${price}'),
                        // if you need to show quantity, you'll need to pass that with productsIDs (e.g. map id->qty)
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              finished?SizedBox():
              GestureDetector(
                onTap: () async {
                  Customer tempCustomer = Customer(
                    uid: _store.currentUser.uid, 
                    name: _store.currentUser.name, 
                    email: _store.currentUser.email, 
                    saved: _store.currentUser.saved, 
                    cart: productsIDs);
                  await _store.saveUpdateOrder(tempCustomer, address,true,date);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order Finished')),
                  );
                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    //width: 95,
                    //height: 315,
                    //alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    // margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 202, 204),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'finish',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
