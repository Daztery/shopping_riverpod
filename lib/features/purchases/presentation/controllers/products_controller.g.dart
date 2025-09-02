// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsRepositoryHash() =>
    r'3f4af6799367258fe3868c96f22ee551c23e430e';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductsRepositoryRef = AutoDisposeProviderRef<ProductsRepository>;
String _$getProductsHash() => r'ce5c57a3ffe2b9790deff73e3194130559e266b8';

/// See also [getProducts].
@ProviderFor(getProducts)
final getProductsProvider = AutoDisposeProvider<GetAllProductsUseCase>.internal(
  getProducts,
  name: r'getProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsRef = AutoDisposeProviderRef<GetAllProductsUseCase>;
String _$addProductHash() => r'a9271f6fb5866dfe9425c5f04f9d8bec79336706';

/// See also [addProduct].
@ProviderFor(addProduct)
final addProductProvider = AutoDisposeProvider<AddProductUseCase>.internal(
  addProduct,
  name: r'addProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateProductRef = AutoDisposeProviderRef<UpdateProductUseCase>;
String _$productsControllerHash() =>
    r'8902e957bb20c4bae6d17bcd41e42324666361c4';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
