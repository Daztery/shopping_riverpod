import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_riverpod/core/di.dart';
import 'package:shopping_riverpod/features/purchases/data/datasources/purchases_local_datasource.dart';
import 'package:shopping_riverpod/features/purchases/data/repositories/products_repository_impl.dart';
import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/products_repository.dart';
import 'package:shopping_riverpod/features/purchases/domain/usecases/add_product_use_case.dart';
import 'package:shopping_riverpod/features/purchases/domain/usecases/get_all_products_use_case.dart';
import 'package:shopping_riverpod/features/purchases/domain/usecases/remove_product_use_case.dart';
import 'package:shopping_riverpod/features/purchases/domain/usecases/update_product_use_case.dart';
import 'package:shopping_riverpod/features/purchases/presentation/state/products_state.dart';

part 'products_controller.g.dart';

@riverpod
ProductsRepository productsRepository(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ProductsRepositoryImpl(
    localDataSource: PurchasesLocalDataSource(prefs: prefs),
  );
}

@riverpod
GetAllProductsUseCase getProducts(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetAllProductsUseCase(repository: repository);
}

@riverpod
AddProductUseCase addProduct(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return AddProductUseCase(repository: repository);
}

@riverpod
RemoveProductUseCase removeProduct(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return RemoveProductUseCase(repository: repository);
}

@riverpod
UpdateProductUseCase updateProduct(Ref ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return UpdateProductUseCase(repository: repository);
}

@Riverpod(keepAlive: true)
class ProductsController extends _$ProductsController {
  @override
  ProductsState build() {
    Future.microtask(_load);
    return const ProductsState(isLoading: true);
  }

  Future<void> _load() async {
    try {
      final items = await ref.read(getProductsProvider).call();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> add(String name, double price, int quantity) async {
    try {
      final id = _genID();
      final p = Product(id: id, name: name, price: price, quantity: quantity);
      final updated = await ref.read(addProductProvider).call(state.items, p);
      state = state.copyWith(items: updated, error: null);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> remove(String id) async {
    try {
      final updated = await ref
          .read(removeProductProvider)
          .call(state.items, id);
      state = state.copyWith(items: updated, error: null);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> update(Product p) async {
    try {
      final updated = await ref
          .read(updateProductProvider)
          .call(state.items, p);
      state = state.copyWith(items: updated, error: null);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> clearAll() async {
    try {
      state = state.copyWith(items: [], error: null);
      await ref.read(productsRepositoryProvider).saveAll([]);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  String _genID() {
    final rnd = Random();
    return '${DateTime.now().millisecondsSinceEpoch}-${rnd.nextInt(1 << 32)}';
  }
}
