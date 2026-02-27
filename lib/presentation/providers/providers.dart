import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import '../../data/database.dart';
import '../../data/settings_repository_impl.dart';
import '../../data/menu_repository_impl.dart';
import '../../data/pos_repository_impl.dart';
import '../../data/expense_repository_impl.dart';
import '../../data/staff_repository_impl.dart';
import '../../data/supplier_repository_impl.dart';
import '../../services/pdf_service.dart';
import '../../services/print_service.dart';

// Database
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

// Repositories
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(ref.watch(databaseProvider));
});

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  return MenuRepositoryImpl(ref.watch(databaseProvider));
});

final posRepositoryProvider = Provider<POSRepository>((ref) {
  return POSRepositoryImpl(ref.watch(databaseProvider));
});

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepositoryImpl(ref.watch(databaseProvider));
});

final staffRepositoryProvider = Provider<StaffRepository>((ref) {
  return StaffRepositoryImpl(ref.watch(databaseProvider));
});

final supplierRepositoryProvider = Provider<SupplierRepository>((ref) {
  return SupplierRepositoryImpl(ref.watch(databaseProvider));
});

// Services
final pdfServiceProvider = Provider<PdfService>((ref) => PdfService());
final printServiceProvider = Provider<PrintService>((ref) => PrintService());
final selectedBluetoothPrinterProvider = StateProvider<BluetoothDevice?>(
  (ref) => null,
);

// Settings Watcher
final settingsProvider = StreamProvider<Setting?>((ref) {
  return Stream.fromFuture(ref.watch(settingsRepositoryProvider).getSettings());
});

// Menu Category Watcher
final categoriesProvider = StreamProvider<List<Category>>((ref) {
  return ref.watch(menuRepositoryProvider).watchCategories();
});

final menuItemsByCategoryProvider = StreamProvider.family<List<MenuItem>, int?>(
  (ref, categoryId) {
    return ref.watch(menuRepositoryProvider).watchMenuItems(categoryId);
  },
);

final invoicesProvider = StreamProvider<List<Invoice>>((ref) {
  return ref.watch(posRepositoryProvider).watchInvoices();
});

final invoiceItemsByInvoiceProvider =
    StreamProvider.family<List<InvoiceItem>, int>((ref, invoiceId) {
      return ref.watch(posRepositoryProvider).watchInvoiceItems(invoiceId);
    });

final expensesProvider = StreamProvider<List<Expense>>((ref) {
  return ref.watch(expenseRepositoryProvider).watchExpenses();
});

final staffListProvider = StreamProvider<List<StaffData>>((ref) {
  return ref.watch(staffRepositoryProvider).watchStaff();
});

final attendanceByDateProvider =
    StreamProvider.family<List<AttendanceData>, DateTime>((ref, date) {
      return ref.watch(staffRepositoryProvider).watchAttendance(date);
    });

final salariesByStaffProvider = StreamProvider.family<List<Salary>, int>((
  ref,
  staffId,
) {
  return ref.watch(staffRepositoryProvider).watchSalaries(staffId);
});

final suppliersProvider = StreamProvider<List<Supplier>>((ref) {
  return ref.watch(supplierRepositoryProvider).watchSuppliers();
});

final supplierItemsBySupplierProvider =
    StreamProvider.family<List<SupplierItem>, int>((ref, supplierId) {
      return ref
          .watch(supplierRepositoryProvider)
          .watchSupplierItems(supplierId);
    });

final allInvoiceItemsProvider = StreamProvider<List<InvoiceItem>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.invoiceItems).watch();
});

final allMenuItemsProvider = StreamProvider<List<MenuItem>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.select(db.menuItems).watch();
});

// POS Cart Provider (Simple state notifier for the current order)
class CartItem {
  final MenuItem item;
  int quantity;
  CartItem({required this.item, this.quantity = 1});
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(MenuItem item) {
    final existing = state.where((i) => i.item.id == item.id).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity++;
      state = [...state];
    } else {
      state = [...state, CartItem(item: item)];
    }
  }

  void removeItem(int id) {
    state = state.where((i) => i.item.id != id).toList();
  }

  void updateQuantity(int id, int qty) {
    if (qty <= 0) {
      removeItem(id);
      return;
    }
    for (var item in state) {
      if (item.item.id == id) {
        item.quantity = qty;
        break;
      }
    }
    state = [...state];
  }

  void clear() => state = [];

  double get subtotal =>
      state.fold(0, (sum, item) => sum + (item.item.salePrice * item.quantity));
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);
