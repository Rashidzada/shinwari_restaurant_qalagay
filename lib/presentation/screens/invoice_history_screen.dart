import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

enum _InvoiceFilterPeriod { all, today, week, month }

class InvoiceHistoryScreen extends ConsumerStatefulWidget {
  const InvoiceHistoryScreen({super.key});

  @override
  ConsumerState<InvoiceHistoryScreen> createState() =>
      _InvoiceHistoryScreenState();
}

class _InvoiceHistoryScreenState extends ConsumerState<InvoiceHistoryScreen> {
  final _searchController = TextEditingController();
  _InvoiceFilterPeriod _period = _InvoiceFilterPeriod.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final invoices = ref.watch(invoicesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Invoice History')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by invoice no or customer name',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                            icon: const Icon(Icons.clear),
                          ),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _periodChip(_InvoiceFilterPeriod.all, 'All'),
                    _periodChip(_InvoiceFilterPeriod.today, 'Today'),
                    _periodChip(_InvoiceFilterPeriod.week, 'This Week'),
                    _periodChip(_InvoiceFilterPeriod.month, 'This Month'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: invoices.when(
              data: (list) {
                final filtered = list.where(_matchesFilters).toList();
                if (filtered.isEmpty) {
                  return const Center(
                    child: Text('No invoices found for current filters'),
                  );
                }
                return ListView.separated(
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final invoice = filtered[index];
                    return ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(
                        backgroundColor: _statusColor(
                          invoice.status,
                        ).withValues(alpha: 0.12),
                        child: Icon(
                          Icons.receipt_long,
                          color: _statusColor(invoice.status),
                        ),
                      ),
                      title: Text(invoice.invoiceNumber),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            invoice.customerName?.trim().isEmpty ?? true
                                ? 'Walk-in'
                                : invoice.customerName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            DateFormat(
                              'dd-MMM-yyyy HH:mm',
                            ).format(invoice.date),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Rs. ${invoice.grandTotal.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _statusColor(
                                    invoice.status,
                                  ).withValues(alpha: 0.10),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  invoice.status,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: _statusColor(invoice.status),
                                  ),
                                ),
                              ),
                              if (invoice.balanceAmount > 0)
                                Text(
                                  'Bal: ${invoice.balanceAmount.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        tooltip: 'Invoice actions',
                        onSelected: (value) =>
                            _handleInvoiceMenu(context, invoice, value),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'view',
                            child: Text('Open Details'),
                          ),
                          PopupMenuItem(
                            value: 'pay',
                            enabled: invoice.balanceAmount > 0,
                            child: const Text('Receive Payment'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete Invoice'),
                          ),
                        ],
                      ),
                      onLongPress: () =>
                          _showInvoiceQuickActions(context, invoice),
                      onTap: () => _showInvoiceDetails(context, invoice),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(height: 10),
                    Text('Loading invoices...'),
                  ],
                ),
              ),
              error: (e, _) =>
                  Center(child: Text('Failed to load invoices: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _periodChip(_InvoiceFilterPeriod value, String label) {
    final selected = _period == value;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF1F1F1F),
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: selected,
      backgroundColor: Colors.white,
      selectedColor: const Color(0xFF2E7D32),
      side: BorderSide(
        color: selected ? const Color(0xFF2E7D32) : Colors.grey.shade300,
      ),
      showCheckmark: false,
      onSelected: (_) => setState(() => _period = value),
    );
  }

  bool _matchesFilters(Invoice invoice) {
    final query = _searchController.text.trim().toLowerCase();
    final customer = (invoice.customerName ?? '').toLowerCase();
    final invoiceNo = invoice.invoiceNumber.toLowerCase();
    final matchesQuery =
        query.isEmpty || customer.contains(query) || invoiceNo.contains(query);
    if (!matchesQuery) return false;

    final now = DateTime.now();
    final invoiceDate = invoice.date;
    switch (_period) {
      case _InvoiceFilterPeriod.all:
        return true;
      case _InvoiceFilterPeriod.today:
        return invoiceDate.year == now.year &&
            invoiceDate.month == now.month &&
            invoiceDate.day == now.day;
      case _InvoiceFilterPeriod.week:
        final todayStart = DateTime(now.year, now.month, now.day);
        final weekStart = todayStart.subtract(Duration(days: now.weekday - 1));
        final weekEnd = weekStart.add(const Duration(days: 7));
        return !invoiceDate.isBefore(weekStart) &&
            invoiceDate.isBefore(weekEnd);
      case _InvoiceFilterPeriod.month:
        return invoiceDate.year == now.year && invoiceDate.month == now.month;
    }
  }

  Future<void> _showInvoiceDetails(
    BuildContext parentContext,
    Invoice invoice,
  ) async {
    final itemsFuture = ref
        .read(posRepositoryProvider)
        .getInvoiceItemsByInvoiceId(invoice.id);
    final settingsAsync = ref.read(settingsProvider);

    await showDialog(
      context: parentContext,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        final pdfFileName = (invoice.pdfPath ?? '').isEmpty
            ? null
            : invoice.pdfPath!.split(RegExp(r'[\\/]')).last;

        return AlertDialog(
          title: Text(
            'Invoice ${invoice.invoiceNumber}',
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          content: SizedBox(
            width: screenSize.width > 700 ? 520 : screenSize.width * 0.88,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: screenSize.height * 0.75),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    settingsAsync.when(
                      data: (s) => Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF2E7D32,
                          ).withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(
                              0xFF2E7D32,
                            ).withValues(alpha: 0.18),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (s?.restaurantName ??
                                  'Shinwari Restaurant Qalagay'),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            if ((s?.ownerName ?? '').trim().isNotEmpty)
                              Text(
                                'Owner: ${s!.ownerName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            if ((s?.phone ?? '').trim().isNotEmpty)
                              Text(
                                'Contact: ${s!.phone}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Date: ${DateFormat('dd-MMM-yyyy HH:mm').format(invoice.date)}',
                    ),
                    Text(
                      'Customer: ${invoice.customerName?.isNotEmpty == true ? invoice.customerName : 'Walk-in'}',
                    ),
                    Text('Type: ${invoice.orderType}'),
                    Text('Status: ${invoice.status}'),
                    const SizedBox(height: 8),
                    const Text(
                      'Items',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    FutureBuilder<List<InvoiceItem>>(
                      future: itemsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                SizedBox.square(
                                  dimension: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Loading items...'),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text(
                            'Failed to load items: ${snapshot.error}',
                          );
                        }
                        final rows = snapshot.data ?? const <InvoiceItem>[];
                        if (rows.isEmpty) {
                          return const Text('No items found.');
                        }
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 220),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: rows.length,
                            itemBuilder: (context, index) {
                              final row = rows[index];
                              return ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  row.itemName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  'Qty ${row.quantity} x Rs. ${row.price.toStringAsFixed(0)}',
                                ),
                                trailing: Text(
                                  'Rs. ${(row.quantity * row.price).toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    _detailRow('Subtotal', invoice.subtotal),
                    _detailRow('Discount', invoice.discount),
                    _detailRow('Grand Total', invoice.grandTotal, bold: true),
                    _detailRow('Received', invoice.receivedAmount),
                    _detailRow(
                      'Balance',
                      invoice.balanceAmount,
                      bold: invoice.balanceAmount > 0,
                      valueColor: invoice.balanceAmount > 0
                          ? Colors.red
                          : Colors.green.shade700,
                    ),
                    if (pdfFileName != null) ...[
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Tooltip(
                          message: invoice.pdfPath!,
                          child: Text(
                            'PDF: $pdfFileName',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.end,
                      children: [
                        if (invoice.balanceAmount > 0)
                          ElevatedButton.icon(
                            onPressed: () async {
                              Navigator.pop(context);
                              await _showReceivePaymentDialog(
                                parentContext,
                                invoice,
                              );
                            },
                            icon: const Icon(Icons.payments),
                            label: const Text('Receive Payment'),
                          ),
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                        OutlinedButton(
                          onPressed: invoice.pdfPath == null
                              ? null
                              : () => _handlePdfAction(
                                  context,
                                  () => ref
                                      .read(pdfServiceProvider)
                                      .openPdf(invoice.pdfPath!),
                                ),
                          child: const Text('Open PDF'),
                        ),
                        OutlinedButton(
                          onPressed: invoice.pdfPath == null
                              ? null
                              : () => _handlePdfAction(
                                  context,
                                  () => ref
                                      .read(pdfServiceProvider)
                                      .sharePdf(invoice.pdfPath!),
                                ),
                          child: const Text('Share PDF'),
                        ),
                        ElevatedButton.icon(
                          onPressed: invoice.pdfPath == null
                              ? null
                              : () => _handlePdfAction(
                                  context,
                                  () => ref
                                      .read(printServiceProvider)
                                      .printReceipt(pdfPath: invoice.pdfPath!),
                                ),
                          icon: const Icon(Icons.print),
                          label: const Text('Reprint'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: const [],
        );
      },
    );
  }

  Widget _detailRow(
    String label,
    double value, {
    bool bold = false,
    Color? valueColor,
  }) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(
            'Rs. ${value.toStringAsFixed(0)}',
            style: style.copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }

  Future<void> _handleInvoiceMenu(
    BuildContext context,
    Invoice invoice,
    String action,
  ) async {
    switch (action) {
      case 'view':
        await _showInvoiceDetails(context, invoice);
        break;
      case 'pay':
        await _showReceivePaymentDialog(context, invoice);
        break;
      case 'delete':
        await _deleteInvoice(context, invoice);
        break;
    }
  }

  Future<void> _showInvoiceQuickActions(
    BuildContext context,
    Invoice invoice,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Open Details'),
              onTap: () {
                Navigator.pop(sheetContext);
                _showInvoiceDetails(context, invoice);
              },
            ),
            ListTile(
              leading: const Icon(Icons.payments),
              title: const Text('Receive Payment'),
              enabled: invoice.balanceAmount > 0,
              onTap: invoice.balanceAmount <= 0
                  ? null
                  : () {
                      Navigator.pop(sheetContext);
                      _showReceivePaymentDialog(context, invoice);
                    },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Delete Invoice'),
              textColor: Colors.red,
              iconColor: Colors.red,
              onTap: () {
                Navigator.pop(sheetContext);
                _deleteInvoice(context, invoice);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showReceivePaymentDialog(
    BuildContext context,
    Invoice invoice,
  ) async {
    final additionalController = TextEditingController(
      text: invoice.balanceAmount > 0
          ? invoice.balanceAmount.toStringAsFixed(0)
          : '0',
    );
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Receive Payment - ${invoice.invoiceNumber}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Grand Total: Rs. ${invoice.grandTotal.toStringAsFixed(0)}'),
            Text(
              'Already Received: Rs. ${invoice.receivedAmount.toStringAsFixed(0)}',
            ),
            Text(
              'Current Balance: Rs. ${invoice.balanceAmount.toStringAsFixed(0)}',
              style: TextStyle(
                color: invoice.balanceAmount > 0 ? Colors.red : Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: additionalController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Additional Payment Received',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final additional = double.tryParse(
                additionalController.text.trim(),
              );
              if (additional == null || additional <= 0) {
                _snack('Enter a valid additional payment amount.');
                return;
              }

              try {
                final repo = ref.read(posRepositoryProvider);
                final newReceived = invoice.receivedAmount + additional;
                final newBalance = (invoice.grandTotal - newReceived)
                    .clamp(0, double.infinity)
                    .toDouble();
                final newStatus = _statusFromAmounts(
                  grandTotal: invoice.grandTotal,
                  received: newReceived,
                );

                await repo.updateInvoiceStatus(
                  invoice.id,
                  newStatus,
                  newReceived,
                  newBalance,
                );

                final updatedInvoice = await repo.getInvoiceById(invoice.id);
                final invoiceItems = await repo.getInvoiceItemsByInvoiceId(
                  invoice.id,
                );
                if (updatedInvoice != null) {
                  final settings =
                      await ref
                          .read(settingsRepositoryProvider)
                          .getSettings() ??
                      const Setting(
                        id: 0,
                        restaurantName: 'Shinwari Restaurant Qalagay',
                        paperSize: '58mm',
                        adminPin: '1234',
                      );
                  final pdfPath = await ref
                      .read(pdfServiceProvider)
                      .generateReceipt(
                        settings: settings,
                        invoice: updatedInvoice,
                        items: invoiceItems,
                      );
                  await repo.updateInvoicePdfPath(invoice.id, pdfPath);
                }

                if (context.mounted) {
                  Navigator.pop(context);
                }
                _snack(
                  'Payment updated. New balance: Rs. ${newBalance.toStringAsFixed(0)}',
                );
              } catch (e) {
                _snack('Failed to update payment: $e');
              }
            },
            icon: const Icon(Icons.save),
            label: const Text('Save Payment'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteInvoice(BuildContext context, Invoice invoice) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Invoice'),
            content: Text(
              'Delete ${invoice.invoiceNumber}?\nThis will remove invoice items and history record.',
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
      final pdfPath = invoice.pdfPath;
      await ref.read(posRepositoryProvider).deleteInvoice(invoice.id);
      if (pdfPath != null && pdfPath.trim().isNotEmpty) {
        final file = File(pdfPath);
        if (await file.exists()) {
          await file.delete();
        }
      }
      _snack('Invoice deleted.');
    } catch (e) {
      _snack('Failed to delete invoice: $e');
    }
  }

  Future<void> _handlePdfAction(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    try {
      await action();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Action failed: $e')));
      }
    }
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

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
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
}
