import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharmacy_system/model/order.dart';
import 'package:pharmacy_system/model/product.dart';
import 'package:pharmacy_system/pages/admin/controller/admin_provider.dart';
import 'package:pharmacy_system/pages/auth/controllers/navigator.dart';
import 'package:pharmacy_system/pages/order/order.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminUi extends StatefulWidget {
  AdminUi({super.key});

  @override
  State<AdminUi> createState() => _AdminUiState();
}

class _AdminUiState extends State<AdminUi> {
  final List<String> tabs = ['Ongoing', 'Complete'];

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);
    final _store = Provider.of<StoreService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('My Orders')),
      // use StreamBuilder to read orders, split them and display the selected list
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text('Something went wrong')),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final docs = snapshot.data!.docs;
          log(docs[0]["name"]);
          final List<MyOrder> orders = [];
          for (int i = 0; i < docs.length; i++) {
            orders.add(
              MyOrder(
                email: docs[i]["email"],
                name: docs[i]["name"],
                address: docs[i]["address"],
                products: List.from(docs[i]["products"]),
                finished: docs[i]["finished"],
              ),
            );
          }

          // divide orders into ongoing and completed by 'status' field
          final ongoingOrders = orders
              .where(
                (o) => (!o.finished),
              )
              .toList();
          final completedOrders = orders
              .where(
                (o) => (o.finished),
              )
              .toList();

          final displayList = tabProvider.selectedIndex == 0
              ? ongoingOrders
              : completedOrders;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Satoshi',
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tabProvider.selectedIndex == 0
                              ? Color(0xFF452CE8)
                              : Colors.grey[300],
                        ),
                        onPressed: () => tabProvider.selectTab(0),
                        child: Text(
                          'Ongoing Orders',
                          style: TextStyle(
                            color: tabProvider.selectedIndex == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tabProvider.selectedIndex == 1
                              ? Color(0xFF452CE8)
                              : Colors.grey[300],
                        ),
                        onPressed: () => tabProvider.selectTab(1),
                        child: Text(
                          'Finished Orders',
                          style: TextStyle(
                            color: tabProvider.selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: displayList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.inbox, size: 50),
                              SizedBox(height: 16),
                              Text(
                                tabProvider.selectedIndex == 0
                                    ? 'No Ongoing Orders!'
                                    : 'No Completed Orders!',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          itemCount: displayList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10),
                          itemBuilder: (context, index) {

                            // safe access with fallback values
                            final name = displayList[index].name;
                            final email = displayList[index].email;
                            final address = displayList[index].address;
                            final products = displayList[index].products;

                            return InkWell(
                              onTap: (){
                                context.push(SingleOrder(name: name, email: email, address: address, productsIDs: products,finished: tabProvider.selectedIndex == 1,));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 6),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFE0E0E5),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      email.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      address.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
