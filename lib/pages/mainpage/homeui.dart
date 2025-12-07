import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/globalElements/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/cart/controller/cart_provider.dart';
// import 'package:pharmacy_system/pages/mainpage/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/mainpage/notifycationui.dart';
import 'package:pharmacy_system/pages/mainpage/productui.dart';
import 'package:pharmacy_system/pages/mainpage/searchui.dart';
import 'package:pharmacy_system/pages/saved-items/controller/saved_items_provider.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeNotifier>(context);
    final store = Provider.of<StoreService>(context);
    final user = Provider.of<User?>(context);
    final saveditems = Provider.of<SavedItemsProvider>(context);
    final cartItems = Provider.of<CartProvider>(context);
    if (pro.index == 0) {
      //  store.getProducts();
      pro.changeindex();
    }
    // log(store.currentUser.toString());
    return Scaffold(
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            SizedBox(height: 10),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                
                
                Container(
                  //width: 95,
                  //height: 315,
                  //alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 136, 143),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                  'assets/images/medicine.png',
                  scale: 15.5,
                ),
                ),
                Text('Pharmanet', style: Fonts().heading4(color: Coloring().n950)),

                // TextButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const Notifycation(),
                //       ),
                //     );
                //     // Action for "See All"
                //   },
                //   child: Icon(
                //     Icons.notifications_outlined,
                //     color: const Color.fromARGB(255, 0, 0, 0),
                //     size: 35,
                //   ),
                // ),
              ],
            ),

            Form(
              // key: xkey,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Searchui()),
                  );
                },
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: "Search product...",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),

            // Text('Categories', style: Fonts().heading4(color: Coloring().n950)),

            // SizedBox(
            //   height: 100,
            //   width: double.infinity,

            //   child: ListView(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     //physics: const ,
            //     children: [
            //       Column(
            //         children: [
            //           Container(
            //             height: 60,
            //             width: 60,
            //             padding: const EdgeInsets.all(15),
            //             decoration: BoxDecoration(
            //               color: Coloring().p50,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Icon(Icons.medical_services_outlined, size: 30),
            //           ),

            //           Text(
            //             'Vitamins',
            //             style: Fonts().bodyXLargeRegular(
            //               color: Coloring().n800,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(width: 20),

            //       Column(
            //         children: [
            //           Container(
            //             height: 60,
            //             width: 60,
            //             padding: const EdgeInsets.all(15),
            //             decoration: BoxDecoration(
            //               color: Coloring().p50,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Icon(Icons.person_outline_sharp, size: 30),
            //           ),
            //           Text(
            //             'Personal',
            //             style: Fonts().bodyXLargeRegular(
            //               color: Coloring().n800,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(width: 20),

            //       Column(
            //         children: [
            //           Container(
            //             height: 60,
            //             width: 60,
            //             padding: const EdgeInsets.all(15),
            //             decoration: BoxDecoration(
            //               color: Coloring().p50,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Icon(Icons.child_friendly_outlined, size: 30),
            //           ),
            //           Text(
            //             'Baby',
            //             style: Fonts().bodyXLargeRegular(
            //               color: Coloring().n800,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(width: 20),

            //       Column(
            //         children: [
            //           Container(
            //             height: 60,
            //             width: 60,
            //             padding: const EdgeInsets.all(15),
            //             decoration: BoxDecoration(
            //               color: Coloring().p50,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Icon(
            //               Icons.medical_information_outlined,
            //               size: 30,
            //             ),
            //           ),
            //           Text(
            //             'Devices',
            //             style: Fonts().bodyXLargeRegular(
            //               color: Coloring().n800,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(width: 20),

            //       Column(
            //         children: [
            //           Container(
            //             height: 60,
            //             width: 60,
            //             padding: const EdgeInsets.all(15),
            //             decoration: BoxDecoration(
            //               color: Coloring().p50,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Icon(
            //               Icons.face_retouching_natural_outlined,
            //               size: 25,
            //             ),
            //           ),
            //           Text(
            //             'Beauty',
            //             style: Fonts().bodyXLargeRegular(
            //               color: Coloring().n800,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Text('Hot Deals', style: Fonts().heading5(color: Coloring().n950)),
            store.productList.isEmpty
                ? Text("no products")
                : SizedBox(
                    //height: double.infinity,
                    //width: double.infinity,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                          ),
                      itemCount: store.productList.length,
                      physics: ScrollPhysics(
                        parent: BouncingScrollPhysics(
                          parent: FixedExtentScrollPhysics(),
                        ),
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        bool isSaved = saveditems.productsIDs.any(
                          (element) =>
                              element == store.productList[index].productId,
                        );
                        bool inCart = cartItems.productsIDs.any(
                          (Element) =>
                              Element == store.productList[index].productId,
                        );
                        // if(isSaved){saveditems.addProduct(store.productList[index]);}
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Productui(
                                    product: store.productList[index],
                                  ),
                                  // ProductDetailPage(
                                  //   product: store.productList[index],
                                  // ),
                                ),
                              );
                            },
                            //log('${store.productList[index].productId}'),
                            // onTap: () async{
                            //   if(inCart){
                            //       store.currentUser.cart.remove(store.productList[index].productId);
                            //       await store.saveUpdateCustomer(store.currentUser);
                            //       cartItems.removeProduct(store.productList[index]);
                            //       log('removed product ${store.productList[index].productId} from user cart(${store.currentUser.name})');
                            //     }
                            //     else{
                            //       store.currentUser.cart.add(store.productList[index].productId);
                            //       await store.saveUpdateCustomer(store.currentUser);
                            //       cartItems.addProduct(store.productList[index]);
                            //       log('added product ${store.productList[index].productId} from user cart(${store.currentUser.name})');
                            //             }
                            // },
                            child: Container(
                              //width: 160,
                              //height: 280,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAFBFC),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Center(
                                      child: Image(
                                        // width: 270,
                                        height: 150,
                                        image: NetworkImage(
                                          '${store.productList[index].imagePath}',
                                          //scale: .3,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (isSaved) {
                                          store.currentUser.saved.remove(
                                            store.productList[index].productId,
                                          );
                                          await store.saveUpdateCustomer(
                                            store.currentUser,
                                          );
                                          saveditems.removeProduct(
                                            store.productList[index],
                                          );
                                          log(
                                            'removed saved from user(${store.currentUser.name}) :${store.productList[index].productId}',
                                          );
                                        } else {
                                          store.currentUser.saved.add(
                                            store.productList[index].productId,
                                          );
                                          await store.saveUpdateCustomer(
                                            store.currentUser,
                                          );
                                          saveditems.addProduct(
                                            store.productList[index],
                                          );
                                          log(
                                            'added saved to user(${store.currentUser.name}) :${store.productList[index].productId}',
                                          );
                                        }
                                      },
                                      child: Icon(
                                        color: Colors.red,
                                        isSaved
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        // color: const Color(0xFFFA3636),
                                        size: 21,
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 25,
                                    left: 0,
                                    child: Text(
                                      '${store.productList[index].title}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Text(
                                      '\$${store.productList[index].price}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
