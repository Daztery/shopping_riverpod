import 'package:shopping_riverpod/features/purchases/data/datasources/purchases_local_datasource.dart';
import 'package:shopping_riverpod/features/purchases/data/models/product_model.dart';
import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final PurchasesLocalDataSource localDataSource;

  ProductsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Product>> getAllProducts() {
    return localDataSource.load();
  }

  @override
  Future<void> saveAll(List<Product> products) {
    final models = products.map((e) => ProductModel.fromEntity(e)).toList();
    return localDataSource.save(models);
  }
}
