import 'database.dart';

abstract class SettingsRepository {
  Future<Setting?> getSettings();
  Future<void> updateSettings(SettingsCompanion settings);
  Future<bool> verifyPin(String pin);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final AppDatabase db;

  SettingsRepositoryImpl(this.db);

  @override
  Future<Setting?> getSettings() async {
    return await db.select(db.settings).getSingleOrNull();
  }

  @override
  Future<void> updateSettings(SettingsCompanion settings) async {
    final existing = await getSettings();
    if (existing == null) {
      await db.into(db.settings).insert(settings);
    } else {
      await (db.update(
        db.settings,
      )..where((t) => t.id.equals(existing.id))).write(settings);
    }
  }

  @override
  Future<bool> verifyPin(String pin) async {
    final settings = await getSettings();
    if (settings == null) return pin == '1234'; // Default PIN
    return settings.adminPin == pin;
  }
}
