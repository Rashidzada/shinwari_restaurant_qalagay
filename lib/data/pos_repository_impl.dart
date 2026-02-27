import 'package:drift/drift.dart';
import 'database.dart';

abstract class POSRepository {
  Stream<List<Invoice>> watchInvoices();
  Future<String> getNextInvoiceNumber();
  Future<int> createInvoice(
    InvoicesCompanion invoice,
    List<InvoiceItemsCompanion> items,
  );
  Future<Invoice?> getInvoiceById(int id);
  Future<List<InvoiceItem>> getInvoiceItemsByInvoiceId(int invoiceId);
  Stream<List<InvoiceItem>> watchInvoiceItems(int invoiceId);
  Future<void> updateInvoicePdfPath(int id, String pdfPath);
  Future<void> deleteInvoice(int id);
  Future<void> updateInvoiceStatus(
    int id,
    String status,
    double received,
    double balance,
  );
}

class POSRepositoryImpl implements POSRepository {
  final AppDatabase db;

  POSRepositoryImpl(this.db);

  @override
  Stream<List<Invoice>> watchInvoices() {
    return (db.select(db.invoices)..orderBy([
          (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
        ]))
        .watch();
  }

  @override
  Future<String> getNextInvoiceNumber() async {
    final latest =
        await (db.select(db.invoices)
              ..orderBy([
                (t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc),
              ])
              ..limit(1))
            .getSingleOrNull();
    var next = 1;
    if (latest != null) {
      final match = RegExp(r'(\d+)$').firstMatch(latest.invoiceNumber);
      if (match != null) {
        next = int.tryParse(match.group(1) ?? '') != null
            ? int.parse(match.group(1)!) + 1
            : latest.id + 1;
      } else {
        next = latest.id + 1;
      }
    }
    return 'INV-${next.toString().padLeft(6, '0')}';
  }

  @override
  Future<int> createInvoice(
    InvoicesCompanion invoice,
    List<InvoiceItemsCompanion> items,
  ) async {
    return await db.transaction(() async {
      final invoiceId = await db.into(db.invoices).insert(invoice);
      for (var item in items) {
        await db
            .into(db.invoiceItems)
            .insert(item.copyWith(invoiceId: Value(invoiceId)));
      }
      return invoiceId;
    });
  }

  @override
  Stream<List<InvoiceItem>> watchInvoiceItems(int invoiceId) {
    return (db.select(
      db.invoiceItems,
    )..where((t) => t.invoiceId.equals(invoiceId))).watch();
  }

  @override
  Future<Invoice?> getInvoiceById(int id) async {
    return (db.select(
      db.invoices,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<InvoiceItem>> getInvoiceItemsByInvoiceId(int invoiceId) async {
    return (db.select(
      db.invoiceItems,
    )..where((t) => t.invoiceId.equals(invoiceId))).get();
  }

  @override
  Future<void> updateInvoicePdfPath(int id, String pdfPath) async {
    await (db.update(db.invoices)..where((t) => t.id.equals(id))).write(
      InvoicesCompanion(pdfPath: Value(pdfPath)),
    );
  }

  @override
  Future<void> deleteInvoice(int id) async {
    await db.transaction(() async {
      await (db.delete(
        db.invoiceItems,
      )..where((t) => t.invoiceId.equals(id))).go();
      await (db.delete(db.invoices)..where((t) => t.id.equals(id))).go();
    });
  }

  @override
  Future<void> updateInvoiceStatus(
    int id,
    String status,
    double received,
    double balance,
  ) async {
    await (db.update(db.invoices)..where((t) => t.id.equals(id))).write(
      InvoicesCompanion(
        status: Value(status),
        receivedAmount: Value(received),
        balanceAmount: Value(balance),
      ),
    );
  }
}
