import 'package:inventory_system/services/product_service.dart';
import 'package:inventory_system/services/purchase_service.dart';
import 'package:inventory_system/services/supplier_service.dart';
import 'package:riverpod/riverpod.dart';


final productServiceProvider = Provider((ref) => ProductService(ref));
final supplierServiceProvider = Provider((ref) => SupplierService(ref));
final purchaseServiceProvider = Provider((ref) => PurchaseService(ref));
