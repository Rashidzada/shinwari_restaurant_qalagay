import 'package:drift/drift.dart';
import 'database.dart';

abstract class StaffRepository {
  Stream<List<StaffData>> watchStaff();
  Future<void> addStaff(StaffCompanion staff);
  Future<void> updateStaff(StaffData staff);
  Future<void> deleteStaff(int id);

  Stream<List<AttendanceData>> watchAttendance(DateTime date);
  Future<void> markAttendance(AttendanceCompanion attendance);

  Stream<List<Salary>> watchSalaries(int staffId);
  Future<void> paySalary(SalariesCompanion salary);
}

class StaffRepositoryImpl implements StaffRepository {
  final AppDatabase db;

  StaffRepositoryImpl(this.db);

  @override
  Stream<List<StaffData>> watchStaff() {
    return db.select(db.staff).watch();
  }

  @override
  Future<void> addStaff(StaffCompanion staff) async {
    await db.into(db.staff).insert(staff);
  }

  @override
  Future<void> updateStaff(StaffData staff) async {
    await db.update(db.staff).replace(staff);
  }

  @override
  Future<void> deleteStaff(int id) async {
    await (db.delete(db.staff)..where((t) => t.id.equals(id))).go();
  }

  @override
  Stream<List<AttendanceData>> watchAttendance(DateTime date) {
    // Exact date matching (stripping time)
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (db.select(
      db.attendance,
    )..where((t) => t.date.isBetweenValues(start, end))).watch();
  }

  @override
  Future<void> markAttendance(AttendanceCompanion attendance) async {
    // Check if attendance already exists for this staff on this day
    final date = attendance.date.value;
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    final existing =
        await (db.select(db.attendance)..where(
              (t) =>
                  t.staffId.equals(attendance.staffId.value) &
                  t.date.isBetweenValues(start, end),
            ))
            .getSingleOrNull();

    if (existing == null) {
      await db.into(db.attendance).insert(attendance);
    } else {
      await (db.update(
        db.attendance,
      )..where((t) => t.id.equals(existing.id))).write(attendance);
    }
  }

  @override
  Stream<List<Salary>> watchSalaries(int staffId) {
    return (db.select(
      db.salaries,
    )..where((t) => t.staffId.equals(staffId))).watch();
  }

  @override
  Future<void> paySalary(SalariesCompanion salary) async {
    await db.into(db.salaries).insert(salary);
  }
}
