import 'package:collection/collection.dart';
import 'package:inventory_system/global_providers.dart';
import 'package:inventory_system/models/purchase.dart';
import 'package:riverpod/riverpod.dart';

// import 'package:riverpod_sample/global_providers.dart';


class PurchaseService {
  final Ref container;
  List<Purchase> _purchases = [];

  PurchaseService(this.container);

  void addPurchase(String customerName, String productName) {
    final SupplierService = container.read(supplierServiceProvider);
    final productService = container.read(productServiceProvider);

    final customer = SupplierService.supplier.firstWhereOrNull(
      (customer) => customer.name == customerName,
    );

    final product = productService.products.firstWhereOrNull(
      (product) => product.name == productName,
    );

    if (customer != null && product != null) {
      _purchases.add(Purchase(customer, product));
      print('${customer.name} bought ${product.name} (\$${product.price}).');
    } else {
      print('Supplier or Product not found.');
    }
  }

  void viewPurchases() {
    if (_purchases.isEmpty) {
      print('No purchases available.');
    } else {
      print('Purchases:');
      for (var purchase in _purchases) {
        print(purchase);
      }
    }
  }

  List<Purchase> get purchases => _purchases;
}