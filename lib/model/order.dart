class MyOrder {
  final String name;
  final String email;
  final String address;
  final List<String> products;
  final bool finished;
  final String dateTime;

  MyOrder({required this.dateTime, required this.email, required this.name, required this.address, required this.products, required this.finished});
  @override
  String toString() {
    return 'Order(name: $name, email: $email, address $address, products: ${products.toString()}, finished: $finished)';
  }
}