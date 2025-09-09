import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_riverpod/core/di.dart';
import 'package:shopping_riverpod/features/purchases/data/models/product_model.dart';
import 'package:shopping_riverpod/features/purchases/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());

  final productsBox = await Hive.openBox<ProductModel>('productsBox');
  final settingsBox = await Hive.openBox('settingsBox');

  runApp(
    ProviderScope(
      overrides: [
        productsBoxProvider.overrideWithValue(productsBox),
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purchases App (Riverpod + Clean)',
      home: const HomePage(),
    );
  }
}
