import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class SupplierManagementScreen extends ConsumerStatefulWidget {
  const SupplierManagementScreen({super.key});

  @override
  ConsumerState<SupplierManagementScreen> createState() =>
      _SupplierManagementScreenState();
}

class _SupplierManagementScreenState
    extends ConsumerState<SupplierManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final suppliersAsync = ref.watch(suppliersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Supplier Management')),
      body: suppliersAsync.when(
        data: (suppliers) {
          if (suppliers.isEmpty)
            return const Center(child: Text('No suppliers added yet'));
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: suppliers.length,
            itemBuilder: (context, index) {
              final supplier = suppliers[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ExpansionTile(
                  title: Text(supplier.name),
                  subtitle: Text(
                    '${supplier.phone}${(supplier.address ?? '').trim().isNotEmpty ? ' | ${supplier.address}' : ''}',
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _showSupplierDialog(existing: supplier);
                      } else if (value == 'delete') {
                        _deleteSupplier(supplier);
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit Supplier'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete Supplier'),
                      ),
                    ],
                  ),
                  children: [_buildSupplierItems(supplier)],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load suppliers: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showSupplierDialog(),
        icon: const Icon(Icons.local_shipping),
        label: const Text('Supplier'),
      ),
    );
  }

  Widget _buildSupplierItems(Supplier supplier) {
    final itemsAsync = ref.watch(supplierItemsBySupplierProvider(supplier.id));

    return itemsAsync.when(
      data: (items) => Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (items.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('No supplier items yet'),
              ),
            for (final item in items)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(item.itemName),
                subtitle: Text(
                  'Rs. ${item.purchasePrice.toStringAsFixed(0)} / ${item.unit}',
                ),
                trailing: Wrap(
                  spacing: 4,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showSupplierItemDialog(
                        supplierId: supplier.id,
                        existing: item,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _deleteSupplierItem(item),
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () =>
                    _showSupplierItemDialog(supplierId: supplier.id),
                icon: const Icon(Icons.add),
                label: const Text('Add Supplier Item'),
              ),
            ),
          ],
        ),
      ),
      loading: () => const Padding(
        padding: EdgeInsets.all(12),
        child: CircularProgressIndicator(),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text('Failed to load supplier items: $e'),
      ),
    );
  }

  Future<void> _showSupplierDialog({Supplier? existing}) async {
    final nameController = TextEditingController(text: existing?.name ?? '');
    final phoneController = TextEditingController(text: existing?.phone ?? '');
    final addressController = TextEditingController(
      text: existing?.address ?? '',
    );

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existing == null ? 'Add Supplier' : 'Edit Supplier'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
        ),
        actions: [
          if (existing != null)
            TextButton(
              onPressed: () async {
                await ref
                    .read(supplierRepositoryProvider)
                    .deleteSupplier(existing.id);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final phone = phoneController.text.trim();
              final address = addressController.text.trim();
              if (name.isEmpty || phone.isEmpty) {
                _snack('Name and phone are required.');
                return;
              }
              final repo = ref.read(supplierRepositoryProvider);
              if (existing == null) {
                await repo.addSupplier(
                  SuppliersCompanion.insert(
                    name: name,
                    phone: phone,
                    address: drift.Value(address.isEmpty ? null : address),
                  ),
                );
              } else {
                await repo.updateSupplier(
                  existing.copyWith(
                    name: name,
                    phone: phone,
                    address: drift.Value(address.isEmpty ? null : address),
                  ),
                );
              }
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(existing == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _showSupplierItemDialog({
    required int supplierId,
    SupplierItem? existing,
  }) async {
    final nameController = TextEditingController(
      text: existing?.itemName ?? '',
    );
    final priceController = TextEditingController(
      text: existing != null ? existing.purchasePrice.toStringAsFixed(0) : '',
    );
    final unitController = TextEditingController(text: existing?.unit ?? '');

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          existing == null ? 'Add Supplier Item' : 'Edit Supplier Item',
        ),
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
                controller: priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: 'Purchase Price'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: unitController,
                decoration: const InputDecoration(labelText: 'Unit'),
              ),
            ],
          ),
        ),
        actions: [
          if (existing != null)
            TextButton(
              onPressed: () async {
                await ref
                    .read(supplierRepositoryProvider)
                    .deleteSupplierItem(existing.id);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final unit = unitController.text.trim();
              final price = double.tryParse(priceController.text.trim());
              if (name.isEmpty || unit.isEmpty || price == null) {
                _snack('Name, unit and valid purchase price are required.');
                return;
              }
              final repo = ref.read(supplierRepositoryProvider);
              if (existing == null) {
                await repo.addSupplierItem(
                  SupplierItemsCompanion.insert(
                    supplierId: supplierId,
                    itemName: name,
                    purchasePrice: price,
                    unit: unit,
                  ),
                );
              } else {
                await repo.updateSupplierItem(
                  existing.copyWith(
                    supplierId: supplierId,
                    itemName: name,
                    purchasePrice: price,
                    unit: unit,
                  ),
                );
              }
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(existing == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteSupplier(Supplier supplier) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Supplier'),
            content: Text('Delete "${supplier.name}"?'),
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
      await ref.read(supplierRepositoryProvider).deleteSupplier(supplier.id);
    } catch (e) {
      _snack('Delete failed. Remove supplier items first. ($e)');
    }
  }

  Future<void> _deleteSupplierItem(SupplierItem item) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Supplier Item'),
            content: Text('Delete "${item.itemName}"?'),
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
    await ref.read(supplierRepositoryProvider).deleteSupplierItem(item.id);
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
