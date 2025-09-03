import 'package:flutter/material.dart';
import 'package:shopping_riverpod/features/purchases/domain/entities/product.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency();
    final subTotal = product.price * product.quantity;

    return ListTile(
      title: Text(product.name),
      subtitle: Text(
        'Price: ${currency.format(product.price)}  •  Qty: ${product.quantity}',
      ),
      trailing: Text(
        "S/ $subTotal",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      onTap: onTap,
    );
  }
}
