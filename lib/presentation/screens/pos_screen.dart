import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  int? selectedCategoryId;
  final _customerController = TextEditingController();
  final _discountController = TextEditingController(text: '0');
  final _receivedController = TextEditingController(text: '0');
  String _orderType = 'Dine-in';
  bool _isSaving = false;

  @override
  void dispose() {
    _customerController.dispose();
    _discountController.dispose();
    _receivedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final menuItems = ref.watch(
      menuItemsByCategoryProvider(selectedCategoryId),
    );
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    final subtotal = cartNotifier.subtotal;
    final discount = _parseMoney(_discountController.text);
    final grandTotal = (subtotal - discount)
        .clamp(0, double.infinity)
        .toDouble();
    final received = _parseMoney(_receivedController.text);
    final balance = (grandTotal - received)
        .clamp(0, double.infinity)
        .toDouble();
    final status = _statusFromAmounts(
      grandTotal: grandTotal,
      received: received,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Bill / POS'),
        actions: [
          if (_isSaving)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1000;
          final menuPanel = _buildMenuPanel(
            categories,
            menuItems,
            cartNotifier,
            constraints.maxWidth,
            isWide,
          );
          final cartPanel = _buildCartPanel(
            context: context,
            cart: cart,
            cartNotifier: cartNotifier,
            subtotal: subtotal,
            discount: discount,
            grandTotal: grandTotal,
            received: received,
            balance: balance,
            status: status,
          );

          if (isWide) {
            return Row(
              children: [
                Expanded(flex: 3, child: menuPanel),
                SizedBox(
                  width: 380,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border(
                        left: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: SafeArea(top: false, child: cartPanel),
                  ),
                ),
              ],
            );
          }

          final cartHeight = (constraints.maxHeight * 0.46).clamp(300.0, 520.0);
          return Column(
            children: [
              Expanded(flex: 3, child: menuPanel),
              SizedBox(
                height: cartHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: SafeArea(top: false, child: cartPanel),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMenuPanel(
    AsyncValue<List<Category>> categories,
    AsyncValue<List<MenuItem>> menuItems,
    CartNotifier cartNotifier,
    double width,
    bool isWide,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 64,
          child: categories.when(
            data: (list) => ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                final isAll = index == 0;
                final category = isAll ? null : list[index - 1];
                final isSelected = isAll
                    ? selectedCategoryId == null
                    : selectedCategoryId == category?.id;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  child: ChoiceChip(
                    label: Text(isAll ? 'All' : category!.name),
                    selected: isSelected,
                    onSelected: (_) =>
                        setState(() => selectedCategoryId = category?.id),
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) =>
                const Center(child: Text('Failed to load categories')),
          ),
        ),
        Expanded(
          child: menuItems.when(
            data: (items) {
              final availableItems = items.where((e) => e.isAvailable).toList();
              if (availableItems.isEmpty) {
                return const Center(
                  child: Text('No available items in this category'),
                );
              }
              final crossAxisCount = isWide
                  ? 3
                  : width < 360
                  ? 1
                  : width >= 700
                  ? 3
                  : 2;
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: availableItems.length,
                itemBuilder: (context, index) =>
                    _buildMenuItemCard(availableItems[index], cartNotifier),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) =>
                const Center(child: Text('Failed to load menu items')),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItemCard(MenuItem item, CartNotifier notifier) {
    return Card(
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => notifier.addItem(item),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.restaurant_menu,
                  color: Colors.green.shade700,
                ),
              ),
              const Spacer(),
              Text(
                item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                'Rs. ${item.salePrice.toStringAsFixed(0)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartPanel({
    required BuildContext context,
    required List<CartItem> cart,
    required CartNotifier cartNotifier,
    required double subtotal,
    required double discount,
    required double grandTotal,
    required double received,
    required double balance,
    required String status,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final panelWidth = constraints.maxWidth;
        final narrowPanel = panelWidth < 350;
        final ultraNarrow = panelWidth < 310;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Current Order',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: cart.isEmpty
                        ? null
                        : () {
                            cartNotifier.clear();
                            setState(() {});
                          },
                    icon: const Icon(Icons.clear_all),
                    label: Text(narrowPanel ? 'Clr' : 'Clear'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      child: cart.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text('Add items to start billing'),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: cart.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final cartItem = cart[index];
                                final lineTotal =
                                    cartItem.item.salePrice * cartItem.quantity;
                                return ListTile(
                                  dense: true,
                                  title: Text(
                                    cartItem.item.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    'Rs. ${cartItem.item.salePrice.toStringAsFixed(0)} x ${cartItem.quantity}',
                                  ),
                                  trailing: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: narrowPanel ? 112 : 132,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          visualDensity: VisualDensity.compact,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(
                                            minWidth: 24,
                                            minHeight: 24,
                                          ),
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            size: 20,
                                          ),
                                          onPressed: () =>
                                              cartNotifier.updateQuantity(
                                                cartItem.item.id,
                                                cartItem.quantity - 1,
                                              ),
                                        ),
                                        Text(
                                          '${cartItem.quantity}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        IconButton(
                                          visualDensity: VisualDensity.compact,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(
                                            minWidth: 24,
                                            minHeight: 24,
                                          ),
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            size: 20,
                                          ),
                                          onPressed: () =>
                                              cartNotifier.updateQuantity(
                                                cartItem.item.id,
                                                cartItem.quantity + 1,
                                              ),
                                        ),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            lineTotal.toStringAsFixed(0),
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            TextField(
                              controller: _customerController,
                              decoration: const InputDecoration(
                                labelText: 'Customer Name (Optional)',
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (ultraNarrow) ...[
                              DropdownButtonFormField<String>(
                                value: _orderType,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Dine-in',
                                    child: Text('Dine-in'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Takeaway',
                                    child: Text('Takeaway'),
                                  ),
                                ],
                                onChanged: (value) => setState(
                                  () => _orderType = value ?? 'Dine-in',
                                ),
                                decoration: const InputDecoration(
                                  labelText: 'Order Type',
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _discountController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                decoration: const InputDecoration(
                                  labelText: 'Discount (Rs)',
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ] else
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      value: _orderType,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'Dine-in',
                                          child: Text('Dine-in'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Takeaway',
                                          child: Text('Takeaway'),
                                        ),
                                      ],
                                      onChanged: (value) => setState(
                                        () => _orderType = value ?? 'Dine-in',
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Order Type',
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      controller: _discountController,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                            decimal: true,
                                          ),
                                      decoration: const InputDecoration(
                                        labelText: 'Discount (Rs)',
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (_) => setState(() {}),
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: _receivedController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              decoration: const InputDecoration(
                                labelText: 'Received Amount',
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (_) => setState(() {}),
                            ),
                            const SizedBox(height: 10),
                            _summaryRow('Subtotal', subtotal),
                            _summaryRow('Discount', discount),
                            _summaryRow('Grand Total', grandTotal, bold: true),
                            _summaryRow('Received', received),
                            _summaryRow('Balance', balance),
                            const SizedBox(height: 6),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8,
                              runSpacing: 6,
                              children: [
                                const Text(
                                  'Status:',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _statusColor(
                                      status,
                                    ).withValues(alpha: 0.12),
                                  ),
                                  child: Text(
                                    status,
                                    style: TextStyle(
                                      color: _statusColor(status),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (ultraNarrow) ...[
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  onPressed: cart.isEmpty || _isSaving
                                      ? null
                                      : () =>
                                            _saveInvoice(printAfterSave: false),
                                  icon: const Icon(Icons.save),
                                  label: const Text('Save'),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: cart.isEmpty || _isSaving
                                      ? null
                                      : () =>
                                            _saveInvoice(printAfterSave: true),
                                  icon: const Icon(Icons.print),
                                  label: const Text('Save & Print'),
                                ),
                              ),
                            ] else
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: cart.isEmpty || _isSaving
                                          ? null
                                          : () => _saveInvoice(
                                              printAfterSave: false,
                                            ),
                                      icon: const Icon(Icons.save),
                                      label: const Text('Save'),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: cart.isEmpty || _isSaving
                                          ? null
                                          : () => _saveInvoice(
                                              printAfterSave: true,
                                            ),
                                      icon: const Icon(Icons.print),
                                      label: Text(
                                        narrowPanel ? 'Print' : 'Save & Print',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _summaryRow(String label, double value, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text('Rs. ${value.toStringAsFixed(0)}', style: style),
        ],
      ),
    );
  }

  Future<void> _saveInvoice({required bool printAfterSave}) async {
    final cart = ref.read(cartProvider);
    if (cart.isEmpty) return;

    final discount = _tryParseMoney(_discountController.text);
    final received = _tryParseMoney(_receivedController.text);
    if (discount == null || received == null) {
      _showSnack('Enter valid discount/received amounts.');
      return;
    }

    final subtotal = cart.fold<double>(
      0,
      (sum, item) => sum + item.item.salePrice * item.quantity,
    );
    final grandTotal = (subtotal - discount)
        .clamp(0, double.infinity)
        .toDouble();
    final balance = (grandTotal - received)
        .clamp(0, double.infinity)
        .toDouble();
    final status = _statusFromAmounts(
      grandTotal: grandTotal,
      received: received,
    );

    setState(() => _isSaving = true);
    try {
      final posRepo = ref.read(posRepositoryProvider);
      final settingsRepo = ref.read(settingsRepositoryProvider);
      final pdfService = ref.read(pdfServiceProvider);
      final printService = ref.read(printServiceProvider);

      final invoiceNumber = await posRepo.getNextInvoiceNumber();
      final now = DateTime.now();

      final invoiceId = await posRepo.createInvoice(
        InvoicesCompanion.insert(
          invoiceNumber: invoiceNumber,
          date: now,
          customerName: _customerController.text.trim().isEmpty
              ? const drift.Value.absent()
              : drift.Value(_customerController.text.trim()),
          orderType: drift.Value(_orderType),
          status: drift.Value(status),
          subtotal: subtotal,
          discount: drift.Value(discount),
          grandTotal: grandTotal,
          receivedAmount: received,
          balanceAmount: balance,
        ),
        [
          for (final item in cart)
            InvoiceItemsCompanion.insert(
              invoiceId: 0,
              menuItemId: item.item.id,
              itemName: item.item.name,
              quantity: item.quantity,
              price: item.item.salePrice,
            ),
        ],
      );

      final invoice = await posRepo.getInvoiceById(invoiceId);
      final invoiceItems = await posRepo.getInvoiceItemsByInvoiceId(invoiceId);
      if (invoice == null) {
        throw Exception('Failed to load saved invoice.');
      }

      final settings =
          await settingsRepo.getSettings() ??
          const Setting(
            id: 0,
            restaurantName: 'Shinwari Restaurant Qalagay',
            paperSize: '58mm',
            adminPin: '1234',
          );
      final pdfPath = await pdfService.generateReceipt(
        settings: settings,
        invoice: invoice,
        items: invoiceItems,
      );
      await posRepo.updateInvoicePdfPath(invoiceId, pdfPath);

      if (printAfterSave) {
        if (Platform.isAndroid) {
          final selectedPrinter = ref.read(selectedBluetoothPrinterProvider);
          if (selectedPrinter != null) {
            await printService.printThermalReceipt(
              settings: settings,
              invoice: invoice,
              items: invoiceItems,
              device: selectedPrinter,
            );
          } else {
            await printService.printReceipt(pdfPath: pdfPath);
          }
        } else {
          await printService.printReceipt(pdfPath: pdfPath);
        }
      }

      ref.read(cartProvider.notifier).clear();
      _customerController.clear();
      _discountController.text = '0';
      _receivedController.text = '0';
      setState(() {});

      _showSnack(
        'Invoice $invoiceNumber saved${printAfterSave ? ' and sent to print flow' : ''}.',
      );
    } catch (e) {
      _showSnack('Failed to save invoice: $e');
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  double _parseMoney(String value) => double.tryParse(value.trim()) ?? 0;

  double? _tryParseMoney(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return 0;
    return double.tryParse(trimmed);
  }

  String _statusFromAmounts({
    required double grandTotal,
    required double received,
  }) {
    if (grandTotal <= 0) return 'PAID';
    if (received <= 0) return 'UNPAID';
    if (received < grandTotal) return 'PARTIAL';
    return 'PAID';
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'PAID':
        return Colors.green;
      case 'PARTIAL':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
