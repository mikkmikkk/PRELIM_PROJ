import 'package:inventory_system/models/supplier.dart';

import 'package:riverpod/riverpod.dart';

class SupplierService {
  final Ref container;
  final List<Supplier> _suppliers = [];

  SupplierService(this.container);

  void addSupplier(String name, String email) {
    final newSuppliers = Supplier(name, email);
    _suppliers.add(newSuppliers);
    print('$name (EmailL $email) has been added.');
  }

  void viewSupplier() {
    if (_suppliers.isEmpty) {
      print('No Suppliers available.');
    } else {
      print('Supplier: ');
      for (var Supplier in _suppliers) {
        print(Supplier);
      }
    }
  }

  List<Supplier> get supplier => _suppliers;
}
