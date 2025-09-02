import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/products_repository.dart';

class RemoveProductUseCase {
  final ProductsRepository repository;
  RemoveProductUseCase({required this.repository});
  Future<List<Product>> call(List<Product> current, String id) async {
    final updated = current.where((e) => e.id != id).toList();
    await repository.saveAll(updated);
    return updated;
  }
}
