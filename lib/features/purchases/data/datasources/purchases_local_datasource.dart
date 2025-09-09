import 'package:hive/hive.dart';

import '../models/product_model.dart';

class PurchasesLocalDataSource {
  final Box<ProductModel> box;

  PurchasesLocalDataSource({required this.box});

  Future<List<ProductModel>> getAllProducts() async {
    return box.values.toList(growable: false);
  }

  Future<void> saveAll(List<ProductModel> products) async {
    await box.clear();
    await box.addAll(products);
  }

  Future<void> addProduct(ProductModel product) async {
    await box.put(product.id, product);
  }

  Future<void> updateProduct(ProductModel product) async {
    await box.put(product.id, product);
  }

  Future<void> deleteProduct(String id) async {
    await box.delete(id);
  }

  Future<void> clearAllProducts() async {
    await box.clear();
  }
}
