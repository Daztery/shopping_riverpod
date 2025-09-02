import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/products_repository.dart';

class GetAllProductsUseCase {
  final ProductsRepository repository;
  GetAllProductsUseCase({required this.repository});
  Future<List<Product>> call() => repository.getAllProducts();
}
