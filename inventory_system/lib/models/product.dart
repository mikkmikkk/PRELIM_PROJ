class Product {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  String toString() {
    // return name '$name (\$$price)';
    return "$name($price)";
  }
}
