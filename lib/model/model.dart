class Customer {
  final String uid;
  final String name;
  final String email;
  final List<String> saved;
  final List<String> cart;

  Customer({required this.uid, required this.name, required this.email, required this.saved, required this.cart});
  @override
  String toString() {
    return 'Customer(uid: $uid, name: $name, email: $email, saved: ${saved.toString()}, cart: ${cart.toString()})';
  }
}
