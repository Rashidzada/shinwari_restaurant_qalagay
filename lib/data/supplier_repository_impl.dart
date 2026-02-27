import 'package:drift/drift.dart';
import 'database.dart';

abstract class SupplierRepository {
  Stream<List<Supplier>> watchSuppliers();
  Future<void> addSupplier(SuppliersCompanion supplier);
  Future<void> updateSupplier(Supplier supplier);
  Future<void> deleteSupplier(int id);

  Stream<List<SupplierItem>> watchSupplierItems(int supplierId);
  Future<void> addSupplierItem(SupplierItemsCompanion item);
  Future<void> updateSupplierItem(SupplierItem item);
  Future<void> deleteSupplierItem(int id);
}

class SupplierRepositoryImpl implements SupplierRepository {
  final AppDatabase db;

  SupplierRepositoryImpl(this.db);

  @override
  Stream<List<Supplier>> watchSuppliers() {
    return db.select(db.suppliers).watch();
  }

  @override
  Future<void> addSupplier(SuppliersCompanion supplier) async {
    await db.into(db.suppliers).insert(supplier);
  }

  @override
  Future<void> updateSupplier(Supplier supplier) async {
    await db.update(db.suppliers).replace(supplier);
  }

  @override
  Future<void> deleteSupplier(int id) async {
    await (db.delete(db.suppliers)..where((t) => t.id.equals(id))).go();
  }

  @override
  Stream<List<SupplierItem>> watchSupplierItems(int supplierId) {
    return (db.select(
      db.supplierItems,
    )..where((t) => t.supplierId.equals(supplierId))).watch();
  }

  @override
  Future<void> addSupplierItem(SupplierItemsCompanion item) async {
    await db.into(db.supplierItems).insert(item);
  }

  @override
  Future<void> updateSupplierItem(SupplierItem item) async {
    await db.update(db.supplierItems).replace(item);
  }

  @override
  Future<void> deleteSupplierItem(int id) async {
    await (db.delete(db.supplierItems)..where((t) => t.id.equals(id))).go();
  }
}
