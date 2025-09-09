import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_riverpod/features/purchases/data/models/product_model.dart';

part 'di.g.dart';

@riverpod
Box<ProductModel> productsBox(Ref ref) {
  throw UnimplementedError('productsBox must be overridden in main');
}

@riverpod
Box settingsBox(Ref ref) {
  throw UnimplementedError('settingsBox must be overridden in main');
}
