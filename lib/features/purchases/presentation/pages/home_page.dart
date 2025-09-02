import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../controllers/products_controller.dart';
import '../controllers/limit_controller.dart';
import '../widgets/product_tile.dart';
import '../../domain/entities/product.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsControllerProvider);
    final limit = ref.watch(limitControllerProvider);
    final currency = NumberFormat.simpleCurrency();

    final total = products.total;
    final limitValue = limit.limit;
    final exceeded = (limitValue != null) ? total > limitValue : false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchases'),
        actions: [
          IconButton(
            tooltip: 'Set spending limit',
            onPressed: () => _showLimitDialog(context, ref, limitValue),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            tooltip: 'Clear all products',
            onPressed: () => _showClearAllDialog(context, ref),
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: products.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: _StatTile(
                          label: 'Total',
                          value: currency.format(total),
                          color: exceeded ? Colors.red : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatTile(
                          label: 'Limit',
                          value: limitValue == null
                              ? '—'
                              : currency.format(limitValue),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0),
                Expanded(
                  child: products.items.isEmpty
                      ? const Center(child: Text('No products yet'))
                      : ListView.separated(
                          itemCount: products.items.length,
                          separatorBuilder: (_, __) => const Divider(height: 0),
                          itemBuilder: (context, index) {
                            final p = products.items[index];
                            return Dismissible(
                              key: ValueKey(p.id),
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 16),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              secondaryBackground: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 16),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (_) => ref
                                  .read(productsControllerProvider.notifier)
                                  .remove(p.id),
                              child: ProductTile(
                                product: p,
                                onTap: () => _showEditDialog(context, ref, p),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final priceCtrl = TextEditingController();
    final qtyCtrl = TextEditingController(text: '1');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Product'),
        content: _ProductForm(
          nameCtrl: nameCtrl,
          priceCtrl: priceCtrl,
          qtyCtrl: qtyCtrl,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              final price = double.tryParse(priceCtrl.text.trim()) ?? 0;
              final qty = int.tryParse(qtyCtrl.text.trim()) ?? 1;
              if (name.isEmpty || price <= 0 || qty <= 0) return;
              ref
                  .read(productsControllerProvider.notifier)
                  .add(name, price, qty);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, Product p) {
    final nameCtrl = TextEditingController(text: p.name);
    final priceCtrl = TextEditingController(text: p.price.toStringAsFixed(2));
    final qtyCtrl = TextEditingController(text: p.quantity.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Product'),
        content: _ProductForm(
          nameCtrl: nameCtrl,
          priceCtrl: priceCtrl,
          qtyCtrl: qtyCtrl,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              final price = double.tryParse(priceCtrl.text.trim()) ?? 0;
              final qty = int.tryParse(qtyCtrl.text.trim()) ?? 1;
              if (name.isEmpty || price <= 0 || qty <= 0) return;
              ref
                  .read(productsControllerProvider.notifier)
                  .update(p.copyWith(name: name, price: price, quantity: qty));
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _showLimitDialog(BuildContext context, WidgetRef ref, double? current) {
    final ctrl = TextEditingController(
      text: current == null ? '' : current.toStringAsFixed(2),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Spending Limit'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Limit (leave empty to clear)',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final txt = ctrl.text.trim();
              final val = txt.isEmpty ? null : double.tryParse(txt);
              if (txt.isNotEmpty && val == null) return;
              await ref.read(limitControllerProvider.notifier).setLimit(val);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

void _showClearAllDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Clear all products'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () async {
            ref.read(productsControllerProvider.notifier).clearAll();
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _StatTile({
    required this.label,
    required this.value,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color ?? Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController priceCtrl;
  final TextEditingController qtyCtrl;

  const _ProductForm({
    required this.nameCtrl,
    required this.priceCtrl,
    required this.qtyCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: 'Name'),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: priceCtrl,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: qtyCtrl,
            decoration: const InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
