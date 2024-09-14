import 'supplier.dart';
import 'product.dart';

class Purchase {
  Supplier customer;
  Product product;

  Purchase(this.customer, this.product);

  @override
  String toString() {
    return '${customer.name} bought ${product.name} (\$${product.price})';
  }
}
