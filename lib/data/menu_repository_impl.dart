import 'package:drift/drift.dart';
import 'database.dart';

abstract class MenuRepository {
  Stream<List<Category>> watchCategories();
  Future<void> addCategory(String name);
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory(int id);

  Stream<List<MenuItem>> watchMenuItems(int? categoryId);
  Future<void> addMenuItem(MenuItemsCompanion item);
  Future<void> updateMenuItem(int id, MenuItemsCompanion item);
  Future<void> deleteMenuItem(int id);
  Future<void> toggleAvailability(int id, bool available);
}

class MenuRepositoryImpl implements MenuRepository {
  final AppDatabase db;

  MenuRepositoryImpl(this.db);

  @override
  Stream<List<Category>> watchCategories() {
    return db.select(db.categories).watch();
  }

  @override
  Future<void> addCategory(String name) async {
    await db.into(db.categories).insert(CategoriesCompanion.insert(name: name));
  }

  @override
  Future<void> updateCategory(Category category) async {
    await db.update(db.categories).replace(category);
  }

  @override
  Future<void> deleteCategory(int id) async {
    await (db.delete(db.categories)..where((t) => t.id.equals(id))).go();
  }

  @override
  Stream<List<MenuItem>> watchMenuItems(int? categoryId) {
    if (categoryId != null) {
      return (db.select(
        db.menuItems,
      )..where((t) => t.categoryId.equals(categoryId))).watch();
    }
    return db.select(db.menuItems).watch();
  }

  @override
  Future<void> addMenuItem(MenuItemsCompanion item) async {
    await db.into(db.menuItems).insert(item);
  }

  @override
  Future<void> updateMenuItem(int id, MenuItemsCompanion item) async {
    await (db.update(db.menuItems)..where((t) => t.id.equals(id))).write(item);
  }

  @override
  Future<void> deleteMenuItem(int id) async {
    await (db.delete(db.menuItems)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> toggleAvailability(int id, bool available) async {
    await (db.update(db.menuItems)..where((t) => t.id.equals(id))).write(
      MenuItemsCompanion(isAvailable: Value(available)),
    );
  }
}
