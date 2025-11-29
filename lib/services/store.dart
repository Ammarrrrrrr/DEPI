import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmacy_system/model/model.dart';
import 'package:pharmacy_system/model/order.dart';
import 'package:pharmacy_system/model/product.dart';

class StoreService extends ChangeNotifier {
  CollectionReference customerCollection = FirebaseFirestore.instance.collection("customers");
  CollectionReference productCollection = FirebaseFirestore.instance.collection("products");
  CollectionReference orderCollection = FirebaseFirestore.instance.collection("orders");
  List<Product> productList = [];
  List<MyOrder> orders = [];
  Customer currentUser = Customer(uid: "uid", name: "name", email: "email", saved: [], cart: []);
  // orders
  Future<void> addOrder(Customer myCustomer,String address) async {
    orderCollection.add({
          "email": myCustomer.email,
          "name": myCustomer.name,
          "products": myCustomer.cart,
          "address":address,
          "finished":false
        })
        .then((value) {
          log("Order Saved");
        })
        .catchError((error) {
          log("Failed to save Order data to firestore: $error");
        });
  }

  Future<void> getMyOrders(String customerEmail) async {
    final QuerySnapshot snapshot = await orderCollection
        .where("email", isEqualTo: customerEmail)
        .get();
    if (snapshot.docs.isNotEmpty) {    
      orders.clear(); 
      for (int i=0; i<snapshot.docs.length;i++){
      orders.add(MyOrder(
        email: snapshot.docs[i]["email"], 
        name: snapshot.docs[i]["name"], 
        address: snapshot.docs[i]["address"], 
        products:  List.from(snapshot.docs[i]["products"]), 
        finished: snapshot.docs[i]["finished"]));
      }
    }
  }
  Future<void> getAllOrders() async {
    final QuerySnapshot snapshot = await orderCollection.get();
    if (snapshot.docs.isNotEmpty) {   
      orders.clear(); 
      log("got all orders");  
      for (int i=0; i<snapshot.docs.length;i++){
      orders.add(MyOrder(
        email: snapshot.docs[i]["email"], 
        name: snapshot.docs[i]["name"], 
        address: snapshot.docs[i]["address"], 
        products:  List.from(snapshot.docs[i]["products"]), 
        finished: snapshot.docs[i]["finished"]));
      }
    }
  }

  Future<void> deleteOrder(String docID) async {
    await orderCollection.doc(docID).delete();
  }

  // Customer
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

  Future<void> getMyUser(String customerEmail) async {
    final QuerySnapshot snapshot = await customerCollection
        .where("email", isEqualTo: customerEmail)
        .get();
    // log("$snapshot");
    // log("${snapshot.docs} ");
    if (snapshot.docs.isNotEmpty) {

      // log("got customer data: ${snapshot.docs[0]["name"]}");
      currentUser = Customer(
        uid: snapshot.docs[0]["uid"], 
        name: snapshot.docs[0]["name"], 
        email: snapshot.docs[0]["email"], 
        saved: List.from(snapshot.docs[0]["saved"]), // the f************* error was that i didn't convert what is comming into a list manully
        cart: List.from(snapshot.docs[0]["cart"]));
      // return currentUser;      
    }
    // return null;
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
    log(docName);
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
