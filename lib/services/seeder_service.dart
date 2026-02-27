import 'package:drift/drift.dart';
import '../data/database.dart';

class SeederService {
  static Future<void> seedDefaultData(AppDatabase db) async {
    // Check if categories are already seeded via MigrationStrategy
    final existingItems = await db.select(db.menuItems).get();
    if (existingItems.isNotEmpty) return;

    final categories = await db.select(db.categories).get();
    if (categories.isEmpty) return; // Should be seeded by Migration

    final chickenId = categories.firstWhere((c) => c.name == 'Chicken').id;
    final beefId = categories.firstWhere((c) => c.name == 'Beef').id;
    final bbqId = categories.firstWhere((c) => c.name == 'BBQ').id;
    final drinksId = categories.firstWhere((c) => c.name == 'Drinks').id;

    await db.batch((b) {
      b.insertAll(db.menuItems, [
        // Chicken
        MenuItemsCompanion.insert(
          categoryId: chickenId,
          name: 'Chicken Biryani',
          salePrice: 350,
          costPrice: const Value(250),
        ),
        MenuItemsCompanion.insert(
          categoryId: chickenId,
          name: 'Chicken Karahi',
          salePrice: 1200,
          costPrice: const Value(800),
        ),
        MenuItemsCompanion.insert(
          categoryId: chickenId,
          name: 'Chicken Handi',
          salePrice: 1400,
          costPrice: const Value(900),
        ),
        MenuItemsCompanion.insert(
          categoryId: chickenId,
          name: 'Chicken Seekh',
          salePrice: 150,
          costPrice: const Value(100),
        ),
        MenuItemsCompanion.insert(
          categoryId: chickenId,
          name: 'Chicken Pulao',
          salePrice: 300,
          costPrice: const Value(200),
        ),

        // Beef
        MenuItemsCompanion.insert(
          categoryId: beefId,
          name: 'Beef Karahi',
          salePrice: 1500,
          costPrice: const Value(1000),
        ),
        MenuItemsCompanion.insert(
          categoryId: beefId,
          name: 'Beef Biryani',
          salePrice: 400,
          costPrice: const Value(300),
        ),
        MenuItemsCompanion.insert(
          categoryId: beefId,
          name: 'Beef Pulao',
          salePrice: 350,
          costPrice: const Value(250),
        ),

        // BBQ
        MenuItemsCompanion.insert(
          categoryId: bbqId,
          name: 'Dumcha',
          salePrice: 800,
          costPrice: const Value(500),
        ),
        MenuItemsCompanion.insert(
          categoryId: bbqId,
          name: 'BBQ Platter',
          salePrice: 2000,
          costPrice: const Value(1400),
        ),

        // Drinks
        MenuItemsCompanion.insert(
          categoryId: drinksId,
          name: 'Coke 1.5L',
          salePrice: 150,
          costPrice: const Value(130),
        ),
        MenuItemsCompanion.insert(
          categoryId: drinksId,
          name: 'Mineral Water',
          salePrice: 60,
          costPrice: const Value(40),
        ),
      ]);

      // Seed default settings
      b.insert(
        db.settings,
        SettingsCompanion.insert(
          restaurantName: const Value('Shinwari Restaurant Qalagay'),
          adminPin: const Value('1234'),
        ),
      );
    });
  }
}
