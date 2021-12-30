class Debt {
  final double price;
  final String name;

  Debt(this.price, this.name);

  @override
  String toString() {
    return 'Debt{price: $price, name: $name}';
  }
}