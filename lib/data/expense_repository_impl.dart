import 'package:drift/drift.dart';
import 'database.dart';

abstract class ExpenseRepository {
  Stream<List<Expense>> watchExpenses();
  Future<void> addExpense(ExpensesCompanion expense);
  Future<void> updateExpense(Expense expense);
  Future<void> deleteExpense(int id);
  Future<double> getTotalExpenses(DateTime start, DateTime end);
}

class ExpenseRepositoryImpl implements ExpenseRepository {
  final AppDatabase db;

  ExpenseRepositoryImpl(this.db);

  @override
  Stream<List<Expense>> watchExpenses() {
    return (db.select(db.expenses)..orderBy([
          (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
        ]))
        .watch();
  }

  @override
  Future<void> addExpense(ExpensesCompanion expense) async {
    await db.into(db.expenses).insert(expense);
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    await db.update(db.expenses).replace(expense);
  }

  @override
  Future<void> deleteExpense(int id) async {
    await (db.delete(db.expenses)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<double> getTotalExpenses(DateTime start, DateTime end) async {
    final query = db.select(db.expenses)
      ..where((t) => t.date.isBetweenValues(start, end));

    final result = await query.get();
    return result.fold<double>(0.0, (sum, item) => sum + item.amount);
  }
}
