import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/products_repository.dart';

class AddProductUseCase {
  final ProductsRepository repository;
  AddProductUseCase({required this.repository});
  Future<List<Product>> call(List<Product> current, Product p) async {
    final updated = [...current, p];
    await repository.saveAll(updated);
    return updated;
  }
}
