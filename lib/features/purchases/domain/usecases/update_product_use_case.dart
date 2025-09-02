import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/products_repository.dart';

class UpdateProductUseCase {
  final ProductsRepository repository;
  UpdateProductUseCase({required this.repository});
  Future<List<Product>> call(List<Product> current, Product p) async {
    final updated = current.map((e) => e.id == p.id ? p : e).toList();
    await repository.saveAll(updated);
    return updated;
  }
}
