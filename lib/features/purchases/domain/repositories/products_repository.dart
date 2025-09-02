import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getAllProducts();
  Future<void> saveAll(List<Product> products);
}
