import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class PurchasesLocalDataSource {
  static const _key = 'products_json';
  final SharedPreferences prefs;

  PurchasesLocalDataSource({required this.prefs});

  Future<List<ProductModel>> load() async {
    final str = prefs.getString(_key);
    if (str == null || str.isEmpty) return [];
    final list = (jsonDecode(str) as List).cast<Map<String, dynamic>>();
    return list.map(ProductModel.fromJson).toList();
  }

  Future<void> save(List<ProductModel> products) async {
    final list = products.map((e) => e.toJson()).toList();
    await prefs.setString(_key, jsonEncode(list));
  }
}
