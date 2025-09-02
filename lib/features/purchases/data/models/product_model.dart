import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.quantity,
  });

  factory ProductModel.fromEntity(Product e) => ProductModel(
    id: e.id,
    name: e.name,
    price: e.price,
    quantity: e.quantity,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as String,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    quantity: json['quantity'] as int,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'quantity': quantity,
  };
}
