import 'dart:io';

import 'package:inventory_system/global_providers.dart';
import 'package:riverpod/riverpod.dart';


void main() {
  final container = ProviderContainer();
  final supplierService = container.read(supplierServiceProvider);
  final productService = container.read(productServiceProvider);
  final purchaseService = container.read(purchaseServiceProvider);

  while (true) {
    print('\nInventory Management System\n');
    print('1. Add a product');
    print('2. View all products');
    print('3. Add Suppliers');
    print('4. View all suppliers');
    print('5. Add Supply Orders');
    print('6. View All Orders');
    print('7. Exit');
    print('\nEnter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the product name:');
        String? name = stdin.readLineSync();
        print('Enter the product price:');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        if (name != null && price != null && name.isNotEmpty) {
          productService.addProduct(name, price);
        } else {
          print('Invalid input. Please try again.');
        }
        break;


      case '2':
        productService.viewProducts();
        break;


      case '3':
        print('Enter Supplier name:');
        String? name = stdin.readLineSync();
        print('Enter Supplier email:');
        String? email = stdin.readLineSync();
        if (name != null &&
            email != null &&
            name.isNotEmpty &&
            email.isNotEmpty) {
          supplierService.addSupplier(name, email);
        } else {
          print('Invalid input. Please try again.');
        }
        break;



      case '4':
        supplierService.viewSupplier();
        break;



      case '5':
        print('Enter the Supplier name:');
        String? supplierName = stdin.readLineSync();
        print('Enter the product name:');
        String? productName = stdin.readLineSync();
        if (supplierName != null &&
            productName != null &&
            supplierName.isNotEmpty &&
            productName.isNotEmpty) {
          purchaseService.addPurchase(supplierName, productName);
        } else {
          print('Invalid input. Please try again.');
        }
        break;



      case '6':
        purchaseService.viewPurchases();
        break;


      case '7':
        print('Exiting the application...');
        return;


      default:
        print('Invalid choice. Please try again.');
    }
  }
}