import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class MenuManagementScreen extends ConsumerStatefulWidget {
  const MenuManagementScreen({super.key});

  @override
  ConsumerState<MenuManagementScreen> createState() =>
      _MenuManagementScreenState();
}

class _MenuManagementScreenState extends ConsumerState<MenuManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Menu Management')),
      body: categories.when(
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('No categories found'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final category = list[index];
              return Card(
                child: ExpansionTile(
                  title: Text(
                    category.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Category ID: ${category.id}'),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'add_item') {
                        _showItemDialog(categoryId: category.id);
                      } else if (value == 'edit_category') {
                        _showCategoryDialog(existing: category);
                      } else if (value == 'delete_category') {
                        _deleteCategory(category);
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'add_item', child: Text('Add Item')),
                      PopupMenuItem(
                        value: 'edit_category',
                        child: Text('Edit Category'),
                      ),
                      PopupMenuItem(
                        value: 'delete_category',
                        child: Text('Delete Category'),
                      ),
                    ],
                  ),
                  children: [_buildItemList(category.id)],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load categories: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCategoryDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Category'),
      ),
    );
  }

  Widget _buildItemList(int categoryId) {
    final items = ref.watch(menuItemsByCategoryProvider(categoryId));

    return items.when(
      data: (list) {
        if (list.isEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => _showItemDialog(categoryId: categoryId),
                icon: const Icon(Icons.add),
                label: const Text('Add first item'),
              ),
            ),
          );
        }
        return Column(
          children: [
            for (final item in list)
              ListTile(
                title: Text(item.name),
                subtitle: Text(
                  'Sale: Rs. ${item.salePrice.toStringAsFixed(0)}'
                  '${item.costPrice != null ? ' | Cost: Rs. ${item.costPrice!.toStringAsFixed(0)}' : ' | Cost: N/A'}',
                ),
                leading: Icon(
                  item.isAvailable ? Icons.check_circle : Icons.remove_circle,
                  color: item.isAvailable ? Colors.green : Colors.red,
                ),
                trailing: Wrap(
                  spacing: 4,
                  children: [
                    Switch(
                      value: item.isAvailable,
                      onChanged: (value) => ref
                          .read(menuRepositoryProvider)
                          .toggleAvailability(item.id, value),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showItemDialog(
                        categoryId: categoryId,
                        existing: item,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _deleteItem(item),
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 12),
                child: TextButton.icon(
                  onPressed: () => _showItemDialog(categoryId: categoryId),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item'),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 10),
            Text('Loading items...'),
          ],
        ),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Failed to load items: $e'),
      ),
    );
  }

  Future<void> _showCategoryDialog({Category? existing}) async {
    final controller = TextEditingController(text: existing?.name ?? '');
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existing == null ? 'Add Category' : 'Edit Category'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Category Name'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isEmpty) return;
              final repo = ref.read(menuRepositoryProvider);
              if (existing == null) {
                await repo.addCategory(name);
              } else {
                await repo.updateCategory(existing.copyWith(name: name));
              }
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(existing == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _showItemDialog({
    required int categoryId,
    MenuItem? existing,
  }) async {
    final nameController = TextEditingController(text: existing?.name ?? '');
    final salePriceController = TextEditingController(
      text: existing != null ? existing.salePrice.toStringAsFixed(0) : '',
    );
    final costPriceController = TextEditingController(
      text: existing?.costPrice?.toStringAsFixed(0) ?? '',
    );
    var isAvailable = existing?.isAvailable ?? true;

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocalState) => AlertDialog(
          title: Text(existing == null ? 'Add Menu Item' : 'Edit Menu Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Item Name'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: salePriceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(labelText: 'Sale Price'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: costPriceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Cost Price (Optional)',
                  ),
                ),
                const SizedBox(height: 10),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: isAvailable,
                  onChanged: (value) =>
                      setLocalState(() => isAvailable = value),
                  title: const Text('Available'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final salePrice = double.tryParse(
                  salePriceController.text.trim(),
                );
                final costPrice = costPriceController.text.trim().isEmpty
                    ? null
                    : double.tryParse(costPriceController.text.trim());
                if (name.isEmpty || salePrice == null) {
                  _snack('Name and valid sale price are required.');
                  return;
                }
                if (costPriceController.text.trim().isNotEmpty &&
                    costPrice == null) {
                  _snack('Cost price must be a valid number.');
                  return;
                }
                final companion = MenuItemsCompanion(
                  categoryId: drift.Value(categoryId),
                  name: drift.Value(name),
                  salePrice: drift.Value(salePrice),
                  costPrice: drift.Value(costPrice),
                  isAvailable: drift.Value(isAvailable),
                );
                final repo = ref.read(menuRepositoryProvider);
                if (existing == null) {
                  await repo.addMenuItem(
                    MenuItemsCompanion.insert(
                      categoryId: categoryId,
                      name: name,
                      salePrice: salePrice,
                      costPrice: drift.Value(costPrice),
                      isAvailable: drift.Value(isAvailable),
                    ),
                  );
                } else {
                  await repo.updateMenuItem(existing.id, companion);
                }
                if (context.mounted) Navigator.pop(context);
              },
              child: Text(existing == null ? 'Add' : 'Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteItem(MenuItem item) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Item'),
            content: Text('Delete "${item.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed) return;
    await ref.read(menuRepositoryProvider).deleteMenuItem(item.id);
  }

  Future<void> _deleteCategory(Category category) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Category'),
            content: Text(
              'Delete "${category.name}"?\nMake sure it has no menu items first.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed) return;
    try {
      await ref.read(menuRepositoryProvider).deleteCategory(category.id);
    } catch (e) {
      _snack('Delete failed. Remove items first. ($e)');
    }
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
