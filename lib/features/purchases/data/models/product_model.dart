import 'package:hive/hive.dart';
import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject implements Product {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String name;

  @override
  @HiveField(2)
  final double price;

  @override
  @HiveField(3)
  final int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory ProductModel.fromEntity(Product e) => ProductModel(
    id: e.id,
    name: e.name,
    price: e.price,
    quantity: e.quantity,
  );

  Product toEntity() =>
      Product(id: id, name: name, price: price, quantity: quantity);

  ProductModel copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
