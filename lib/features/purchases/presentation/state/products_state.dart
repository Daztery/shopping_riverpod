import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';

class ProductsState {
  final List<Product> items;
  final bool isLoading;
  final String? error;

  const ProductsState({
    this.items = const [],
    this.isLoading = false,
    this.error,
  });

  double get total =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  ProductsState copyWith({
    List<Product>? items,
    bool? isLoading,
    String? error,
  }) {
    return ProductsState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
