import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get restaurantName =>
      text().withDefault(const Constant('Shinwari Restaurant Qalagay'))();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get ownerName => text().nullable()();
  TextColumn get ownerCnic => text().nullable()();
  TextColumn get ownerContact => text().nullable()();
  TextColumn get ownerSignature => text().nullable()(); // Path to image
  TextColumn get logoPath => text().nullable()();
  TextColumn get ownerPhotoPath => text().nullable()();
  TextColumn get paperSize =>
      text().withDefault(const Constant('58mm'))(); // 58mm or 80mm
  TextColumn get footerNote => text().nullable()();
  TextColumn get adminPin => text().withDefault(const Constant('1234'))();
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class MenuItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  TextColumn get name => text()();
  RealColumn get salePrice => real()();
  RealColumn get costPrice => real().nullable()();
  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();
}

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNumber => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get customerName => text().nullable()();
  TextColumn get orderType =>
      text().withDefault(const Constant('Dine-in'))(); // Dine-in, Takeaway
  TextColumn get status =>
      text().withDefault(const Constant('PAID'))(); // PAID, PARTIAL, UNPAID
  RealColumn get subtotal => real()();
  RealColumn get discount => real().withDefault(const Constant(0))();
  RealColumn get grandTotal => real()();
  RealColumn get receivedAmount => real()();
  RealColumn get balanceAmount => real()();
  TextColumn get pdfPath => text().nullable()();
}

class InvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().references(Invoices, #id)();
  IntColumn get menuItemId => integer().references(MenuItems, #id)();
  TextColumn get itemName =>
      text()(); // Store name in case menu item is deleted
  IntColumn get quantity => integer()();
  RealColumn get price => real()();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get category => text()();
  RealColumn get amount => real()();
  TextColumn get notes => text().nullable()();
}

class Staff extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get role => text()();
  RealColumn get salary => real()();
}

class Attendance extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get staffId => integer().references(Staff, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get status => text()(); // Present, Absent, Leave
}

class Salaries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get staffId => integer().references(Staff, #id)();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
  TextColumn get status =>
      text().withDefault(const Constant('PAID'))(); // PAID, UNPAID
}

class Suppliers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get address => text().nullable()();
}

class SupplierItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplierId => integer().references(Suppliers, #id)();
  TextColumn get itemName => text()();
  RealColumn get purchasePrice => real()();
  TextColumn get unit => text()(); // kg, pack, etc.
}

@DriftDatabase(
  tables: [
    Settings,
    Categories,
    MenuItems,
    Invoices,
    InvoiceItems,
    Expenses,
    Staff,
    Attendance,
    Salaries,
    Suppliers,
    SupplierItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        // Seed initial categories
        await batch((b) {
          b.insertAll(categories, [
            CategoriesCompanion.insert(name: 'Chicken'),
            CategoriesCompanion.insert(name: 'Beef'),
            CategoriesCompanion.insert(name: 'BBQ'),
            CategoriesCompanion.insert(name: 'Drinks'),
            CategoriesCompanion.insert(name: 'Others'),
          ]);
        });
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    if (Platform.isAndroid) {
      // Helps sqlite load correctly on some Android devices / OS versions.
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'shinwari_pos.sqlite'));
    return NativeDatabase(file);
  });
}
