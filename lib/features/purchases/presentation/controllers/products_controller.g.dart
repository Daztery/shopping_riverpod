// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsBoxHash() => r'8761c03c2ab5190affb23a9ebf8570f3e1f5afe9';

/// See also [_productsBox].
@ProviderFor(_productsBox)
final _productsBoxProvider = AutoDisposeProvider<Box<ProductModel>>.internal(
  _productsBox,
  name: r'_productsBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _ProductsBoxRef = AutoDisposeProviderRef<Box<ProductModel>>;
String _$productsRepositoryHash() =>
    r'62acc57aa13c2de348ade452ef4c1fbca25a0a20';

/// See also [productsRepository].
@ProviderFor(productsRepository)
final productsRepositoryProvider =
    AutoDisposeProvider<ProductsRepository>.internal(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRepositoryRef = AutoDisposeProviderRef<ProductsRepository>;
String _$getProductsHash() => r'ce5c57a3ffe2b9790deff73e3194130559e266b8';

/// See also [getProducts].
@ProviderFor(getProducts)
final getProductsProvider = AutoDisposeProvider<GetAllProductsUseCase>.internal(
  getProducts,
  name: r'getProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetProductsRef = AutoDisposeProviderRef<GetAllProductsUseCase>;
String _$addProductHash() => r'a9271f6fb5866dfe9425c5f04f9d8bec79336706';

/// See also [addProduct].
@ProviderFor(addProduct)
final addProductProvider = AutoDisposeProvider<AddProductUseCase>.internal(
  addProduct,
  name: r'addProductProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddProductRef = AutoDisposeProviderRef<AddProductUseCase>;
String _$removeProductHash() => r'25f83a667d31c8a78810cb277efcb93c5c367d98';

/// See also [removeProduct].
@ProviderFor(removeProduct)
final removeProductProvider =
    AutoDisposeProvider<RemoveProductUseCase>.internal(
  removeProduct,
  name: r'removeProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$removeProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RemoveProductRef = AutoDisposeProviderRef<RemoveProductUseCase>;
String _$updateProductHash() => r'981e4c9bfc17f1694742d821b7c2eb2e7d118d91';

/// See also [updateProduct].
@ProviderFor(updateProduct)
final updateProductProvider =
    AutoDisposeProvider<UpdateProductUseCase>.internal(
  updateProduct,
  name: r'updateProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateProductRef = AutoDisposeProviderRef<UpdateProductUseCase>;
String _$productsControllerHash() =>
    r'78824a0f7ad89433dae49fe4f364c8c618b11cb4';

/// See also [ProductsController].
@ProviderFor(ProductsController)
final productsControllerProvider =
    NotifierProvider<ProductsController, ProductsState>.internal(
  ProductsController.new,
  name: r'productsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsController = Notifier<ProductsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
