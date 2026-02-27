import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

enum _ReportPeriod { daily, weekly, monthly, yearly }

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  _ReportPeriod _period = _ReportPeriod.daily;

  @override
  Widget build(BuildContext context) {
    final invoicesAsync = ref.watch(invoicesProvider);
    final expensesAsync = ref.watch(expensesProvider);
    final invoiceItemsAsync = ref.watch(allInvoiceItemsProvider);
    final menuItemsAsync = ref.watch(allMenuItemsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _periodChip(_ReportPeriod.daily, 'Daily'),
                _periodChip(_ReportPeriod.weekly, 'Weekly'),
                _periodChip(_ReportPeriod.monthly, 'Monthly'),
                _periodChip(_ReportPeriod.yearly, 'Yearly'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: invoicesAsync.when(
                data: (invoices) => expensesAsync.when(
                  data: (expenses) => invoiceItemsAsync.when(
                    data: (invoiceItems) => menuItemsAsync.when(
                      data: (menuItems) => _buildReportBody(
                        invoices: invoices,
                        expenses: expenses,
                        invoiceItems: invoiceItems,
                        menuItems: menuItems,
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, _) =>
                          Center(child: Text('Menu data error: $e')),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) =>
                        Center(child: Text('Invoice items error: $e')),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) =>
                      Center(child: Text('Expense data error: $e')),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Invoice data error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _periodChip(_ReportPeriod value, String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _period == value,
      onSelected: (_) => setState(() => _period = value),
    );
  }

  Widget _buildReportBody({
    required List<Invoice> invoices,
    required List<Expense> expenses,
    required List<InvoiceItem> invoiceItems,
    required List<MenuItem> menuItems,
  }) {
    final now = DateTime.now();
    final (start, end, label) = _currentRange(now);

    final filteredInvoices = invoices
        .where((i) => !i.date.isBefore(start) && i.date.isBefore(end))
        .toList();
    final filteredExpenses = expenses
        .where((e) => !e.date.isBefore(start) && e.date.isBefore(end))
        .toList();

    final invoiceIds = filteredInvoices.map((e) => e.id).toSet();
    final filteredInvoiceItems = invoiceItems
        .where((i) => invoiceIds.contains(i.invoiceId))
        .toList();
    final menuCostById = <int, double?>{
      for (final m in menuItems) m.id: m.costPrice,
    };

    final totalSales = filteredInvoices.fold<double>(
      0,
      (sum, i) => sum + i.grandTotal,
    );
    final paidSales = filteredInvoices
        .where((i) => i.status == 'PAID')
        .fold<double>(0, (sum, i) => sum + i.grandTotal);
    final partialSales = filteredInvoices
        .where((i) => i.status == 'PARTIAL')
        .fold<double>(0, (sum, i) => sum + i.grandTotal);
    final unpaidSales = filteredInvoices
        .where((i) => i.status == 'UNPAID')
        .fold<double>(0, (sum, i) => sum + i.grandTotal);
    final totalExpenses = filteredExpenses.fold<double>(
      0,
      (sum, e) => sum + e.amount,
    );

    var costOfItemsSold = 0.0;
    var missingCostPrice = false;
    for (final item in filteredInvoiceItems) {
      final costPrice = menuCostById[item.menuItemId];
      if (costPrice == null) {
        missingCostPrice = true;
        continue;
      }
      costOfItemsSold += costPrice * item.quantity;
    }

    final profitLoss = totalSales - (totalExpenses + costOfItemsSold);
    final salesMinusExpenses = totalSales - totalExpenses;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _metricCard(
            title: 'Sales',
            color: Colors.blue,
            icon: Icons.trending_up,
            value: 'Rs. ${totalSales.toStringAsFixed(0)}',
            subtitle:
                'Paid: ${paidSales.toStringAsFixed(0)} | Partial: ${partialSales.toStringAsFixed(0)} | Unpaid: ${unpaidSales.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 10),
          _metricCard(
            title: 'Expenses',
            color: Colors.red,
            icon: Icons.money_off,
            value: 'Rs. ${totalExpenses.toStringAsFixed(0)}',
            subtitle: 'Transactions: ${filteredExpenses.length}',
          ),
          const SizedBox(height: 10),
          _metricCard(
            title: 'Cost Of Items Sold',
            color: Colors.orange,
            icon: Icons.inventory_2,
            value: 'Rs. ${costOfItemsSold.toStringAsFixed(0)}',
            subtitle: 'Invoice items: ${filteredInvoiceItems.length}',
          ),
          const SizedBox(height: 10),
          Card(
            color: (profitLoss >= 0 ? Colors.green : Colors.red).withValues(
              alpha: 0.08,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profit / Loss',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rs. ${profitLoss.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: profitLoss >= 0
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Formula: Sales - (Expenses + CostOfItemsSold)'),
                  if (missingCostPrice) ...[
                    const SizedBox(height: 8),
                    const Text(
                      'Warning: Some menu items are missing cost price. Also showing Sales - Expenses.',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sales - Expenses: Rs. ${salesMinusExpenses.toStringAsFixed(0)}',
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Invoices in period'),
              trailing: Text(
                '${filteredInvoices.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricCard({
    required String title,
    required Color color,
    required IconData icon,
    required String value,
    required String subtitle,
  }) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  (DateTime, DateTime, String) _currentRange(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    switch (_period) {
      case _ReportPeriod.daily:
        final start = today;
        final end = start.add(const Duration(days: 1));
        return (
          start,
          end,
          'Daily Report (${start.day}/${start.month}/${start.year})',
        );
      case _ReportPeriod.weekly:
        final start = today.subtract(Duration(days: now.weekday - 1));
        final end = start.add(const Duration(days: 7));
        return (start, end, 'Weekly Report');
      case _ReportPeriod.monthly:
        final start = DateTime(now.year, now.month, 1);
        final end = DateTime(now.year, now.month + 1, 1);
        return (start, end, 'Monthly Report');
      case _ReportPeriod.yearly:
        final start = DateTime(now.year, 1, 1);
        final end = DateTime(now.year + 1, 1, 1);
        return (start, end, 'Yearly Report');
    }
  }
}
