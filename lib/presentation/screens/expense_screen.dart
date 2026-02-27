import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class ExpenseScreen extends ConsumerStatefulWidget {
  const ExpenseScreen({super.key});

  @override
  ConsumerState<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends ConsumerState<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    final expenses = ref.watch(expensesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      body: expenses.when(
        data: (list) => Column(
          children: [
            _buildTotals(list),
            const Divider(height: 1),
            Expanded(
              child: list.isEmpty
                  ? const Center(child: Text('No expenses yet'))
                  : ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final expense = list[index];
                        return ListTile(
                          title: Text(expense.category),
                          subtitle: Text(
                            '${DateFormat('dd-MMM-yyyy').format(expense.date)}'
                            '${(expense.notes ?? '').trim().isNotEmpty ? ' | ${expense.notes}' : ''}',
                          ),
                          trailing: Text(
                            'Rs. ${expense.amount.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => _showExpenseDialog(existing: expense),
                          onLongPress: () => _deleteExpense(expense),
                        );
                      },
                    ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load expenses: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showExpenseDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Expense'),
      ),
    );
  }

  Widget _buildTotals(List<Expense> list) {
    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day);
    final weekStart = dayStart.subtract(Duration(days: now.weekday - 1));
    final monthStart = DateTime(now.year, now.month, 1);
    final yearStart = DateTime(now.year, 1, 1);

    double sumInRange(DateTime start, DateTime end) {
      return list
          .where((e) => !e.date.isBefore(start) && e.date.isBefore(end))
          .fold<double>(0, (sum, e) => sum + e.amount);
    }

    final daily = sumInRange(dayStart, dayStart.add(const Duration(days: 1)));
    final weekly = sumInRange(
      weekStart,
      weekStart.add(const Duration(days: 7)),
    );
    final monthly = sumInRange(
      monthStart,
      DateTime(now.year, now.month + 1, 1),
    );
    final yearly = sumInRange(yearStart, DateTime(now.year + 1, 1, 1));

    final totals = [
      ('Daily', daily, Colors.orange),
      ('Weekly', weekly, Colors.blue),
      ('Monthly', monthly, Colors.purple),
      ('Yearly', yearly, Colors.red),
    ];

    return SizedBox(
      height: 130,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        scrollDirection: Axis.horizontal,
        itemCount: totals.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final (label, amount, color) = totals[index];
          return SizedBox(
            width: 160,
            child: Card(
              color: color.withValues(alpha: 0.08),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Rs. ${amount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showExpenseDialog({Expense? existing}) async {
    final categoryController = TextEditingController(
      text: existing?.category ?? '',
    );
    final amountController = TextEditingController(
      text: existing != null ? existing.amount.toStringAsFixed(0) : '',
    );
    final notesController = TextEditingController(text: existing?.notes ?? '');
    DateTime selectedDate = existing?.date ?? DateTime.now();

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocalState) => AlertDialog(
          title: Text(existing == null ? 'Add Expense' : 'Edit Expense'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Date'),
                  subtitle: Text(
                    DateFormat('dd-MMM-yyyy').format(selectedDate),
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      setLocalState(
                        () => selectedDate = DateTime(
                          picked.year,
                          picked.month,
                          picked.day,
                          existing?.date.hour ?? DateTime.now().hour,
                          existing?.date.minute ?? DateTime.now().minute,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            if (existing != null)
              TextButton(
                onPressed: () async {
                  await ref
                      .read(expenseRepositoryProvider)
                      .deleteExpense(existing.id);
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
                final category = categoryController.text.trim();
                final amount = double.tryParse(amountController.text.trim());
                if (category.isEmpty || amount == null) {
                  _snack('Category and valid amount are required.');
                  return;
                }
                final repo = ref.read(expenseRepositoryProvider);
                if (existing == null) {
                  await repo.addExpense(
                    ExpensesCompanion.insert(
                      date: selectedDate,
                      category: category,
                      amount: amount,
                      notes: drift.Value(
                        notesController.text.trim().isEmpty
                            ? null
                            : notesController.text.trim(),
                      ),
                    ),
                  );
                } else {
                  await repo.updateExpense(
                    existing.copyWith(
                      date: selectedDate,
                      category: category,
                      amount: amount,
                      notes: drift.Value(
                        notesController.text.trim().isEmpty
                            ? null
                            : notesController.text.trim(),
                      ),
                    ),
                  );
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

  Future<void> _deleteExpense(Expense expense) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Expense'),
            content: Text('Delete "${expense.category}" expense?'),
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
    await ref.read(expenseRepositoryProvider).deleteExpense(expense.id);
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
