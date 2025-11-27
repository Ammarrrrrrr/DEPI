import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmacy_system/model/model.dart';
import 'package:pharmacy_system/model/product.dart';

class StoreService extends ChangeNotifier {
  CollectionReference customerCollection = FirebaseFirestore.instance.collection("customers");
  CollectionReference productCollection = FirebaseFirestore.instance.collection("products");
  List<Product> productList = [];
  Customer currentUser = Customer(uid: "uid", name: "name", email: "email", saved: [], cart: []);

  Future<void> saveUpdateCustomer(Customer myCustomer) async {
    // remove @gmail.com from email
    String docName = myCustomer.email.split("@")[0];
    customerCollection
        .doc(docName)
        .set({
          "uid": myCustomer.uid,
          "email": myCustomer.email,
          "name": myCustomer.name,
          "cart": myCustomer.cart,
          "saved": myCustomer.saved,
        })
        .then((value) {
          log("Customer Saved: $docName");
        })
        .catchError((error) {
          log("Failed to save customer data to firestore: $error");
        });
  }

  Future<Customer?> getMyUser(String customerEmail) async {
    final QuerySnapshot snapshot = await customerCollection
        .where("email", isEqualTo: customerEmail)
        .get();
    // log("$snapshot");
    // log("${snapshot.docs} ");
    if (snapshot.docs.isNotEmpty) {

      log("got customer data: ${snapshot.docs[0]["name"]}");
      currentUser = Customer(
        uid: snapshot.docs[0]["uid"], 
        name: snapshot.docs[0]["name"], 
        email: snapshot.docs[0]["email"], 
        saved: snapshot.docs[0]["saved"], 
        cart: snapshot.docs[0]["cart"]);
      return currentUser;
    }
    return null;
  }

  Future<void> deleteCustomer(String docID) async {
    await customerCollection.doc(docID).delete();
  }


  // products 
  Future<void> saveUpdateProduct(Product product) async {
    String docName = product.productId+" "+(product.title.split(' ')[0]);
    productCollection
        .doc(docName).set({
          "productId": product.productId,
          "title": product.title,
          "description": product.description,
          "price": product.price,
          "imagePath": product.imagePath,
        })
        .then((value) {
          log("Product Saved: $docName");
        })
        .catchError((error) {
          log("Failed to save Product data to firestore: $error");
        });
  }

  Future<void> getProducts() async {
    final QuerySnapshot snapshot = await productCollection.get();
    if (snapshot.docs.isNotEmpty) {

      log("got products");
      productList.clear();
      for (var i = 0; i < snapshot.docs.length; i++) {
        productList.add(
          Product(
            productId: snapshot.docs[i]["productId"], 
            imagePath: snapshot.docs[i]["imagePath"], 
            title: snapshot.docs[i]["title"], 
            price: snapshot.docs[i]["price"], 
            description: snapshot.docs[i]["description"]));
        }
    }
  }

  Future<void> deleteProduct(String docID) async {
    await productCollection.doc(docID).delete();
  }
  
}
