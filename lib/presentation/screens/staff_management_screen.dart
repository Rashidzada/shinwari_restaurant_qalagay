import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class StaffManagementScreen extends ConsumerStatefulWidget {
  const StaffManagementScreen({super.key});

  @override
  ConsumerState<StaffManagementScreen> createState() =>
      _StaffManagementScreenState();
}

class _StaffManagementScreenState extends ConsumerState<StaffManagementScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  DateTime _attendanceDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Staff'),
            Tab(text: 'Attendance'),
            Tab(text: 'Salaries'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildStaffTab(), _buildAttendanceTab(), _buildSalaryTab()],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showStaffDialog(),
        icon: const Icon(Icons.person_add),
        label: const Text('Staff'),
      ),
    );
  }

  Widget _buildStaffTab() {
    final staffAsync = ref.watch(staffListProvider);

    return staffAsync.when(
      data: (list) {
        if (list.isEmpty)
          return const Center(child: Text('No staff added yet'));
        return ListView.separated(
          itemCount: list.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final staff = list[index];
            return ListTile(
              title: Text(staff.name),
              subtitle: Text(
                '${staff.role} | ${staff.phone} | Salary Rs. ${staff.salary.toStringAsFixed(0)}',
              ),
              trailing: Wrap(
                spacing: 4,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showStaffDialog(existing: staff),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _deleteStaff(staff),
                  ),
                ],
              ),
              onTap: () => _showStaffDialog(existing: staff),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Failed to load staff: $e')),
    );
  }

  Widget _buildAttendanceTab() {
    final staffAsync = ref.watch(staffListProvider);
    final attendanceAsync = ref.watch(
      attendanceByDateProvider(_attendanceDate),
    );

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('Attendance Date'),
          subtitle: Text(DateFormat('dd-MMM-yyyy').format(_attendanceDate)),
          trailing: TextButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _attendanceDate,
                firstDate: DateTime(2020),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) {
                setState(() => _attendanceDate = picked);
              }
            },
            child: const Text('Change'),
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: staffAsync.when(
            data: (staffList) => attendanceAsync.when(
              data: (attendanceRows) {
                if (staffList.isEmpty)
                  return const Center(child: Text('No staff available'));
                final statusByStaffId = <int, String>{
                  for (final row in attendanceRows) row.staffId: row.status,
                };
                return ListView.builder(
                  itemCount: staffList.length,
                  itemBuilder: (context, index) {
                    final staff = staffList[index];
                    final currentStatus = statusByStaffId[staff.id];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    staff.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                if (currentStatus != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _attendanceColor(
                                        currentStatus,
                                      ).withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      currentStatus,
                                      style: TextStyle(
                                        color: _attendanceColor(currentStatus),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _attendanceButton(staff.id, 'Present'),
                                _attendanceButton(staff.id, 'Absent'),
                                _attendanceButton(staff.id, 'Leave'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) =>
                  Center(child: Text('Failed to load attendance: $e')),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Failed to load staff: $e')),
          ),
        ),
      ],
    );
  }

  Widget _buildSalaryTab() {
    final staffAsync = ref.watch(staffListProvider);

    return staffAsync.when(
      data: (staffList) {
        if (staffList.isEmpty)
          return const Center(child: Text('No staff available'));
        return ListView.builder(
          itemCount: staffList.length,
          itemBuilder: (context, index) {
            final staff = staffList[index];
            final salariesAsync = ref.watch(salariesByStaffProvider(staff.id));
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ExpansionTile(
                title: Text(staff.name),
                subtitle: Text(
                  '${staff.role} | Monthly: Rs. ${staff.salary.toStringAsFixed(0)}',
                ),
                trailing: ElevatedButton(
                  onPressed: () => _showSalaryDialog(staff),
                  child: const Text('Record Salary'),
                ),
                children: [
                  salariesAsync.when(
                    data: (salaries) {
                      if (salaries.isEmpty) {
                        return const ListTile(
                          title: Text('No salary records yet'),
                          subtitle: Text(
                            'Use "Record Salary" to mark paid/unpaid entries.',
                          ),
                        );
                      }
                      final sorted = [...salaries]
                        ..sort((a, b) => b.date.compareTo(a.date));
                      return Column(
                        children: [
                          for (final salary in sorted.take(10))
                            ListTile(
                              title: Text(
                                'Rs. ${salary.amount.toStringAsFixed(0)}',
                              ),
                              subtitle: Text(
                                DateFormat('dd-MMM-yyyy').format(salary.date),
                              ),
                              trailing: Text(
                                salary.status,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: salary.status == 'PAID'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, _) =>
                        ListTile(title: Text('Salary load error: $e')),
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Failed to load staff: $e')),
    );
  }

  Widget _attendanceButton(int staffId, String status) {
    final color = _attendanceColor(status);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color),
      ),
      onPressed: () async {
        final d = _attendanceDate;
        await ref
            .read(staffRepositoryProvider)
            .markAttendance(
              AttendanceCompanion.insert(
                staffId: staffId,
                date: DateTime(d.year, d.month, d.day, 12),
                status: status,
              ),
            );
      },
      child: Text(status),
    );
  }

  Future<void> _showStaffDialog({StaffData? existing}) async {
    final nameController = TextEditingController(text: existing?.name ?? '');
    final phoneController = TextEditingController(text: existing?.phone ?? '');
    final roleController = TextEditingController(text: existing?.role ?? '');
    final salaryController = TextEditingController(
      text: existing != null ? existing.salary.toStringAsFixed(0) : '',
    );

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existing == null ? 'Add Staff' : 'Edit Staff'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: salaryController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: 'Monthly Salary'),
              ),
            ],
          ),
        ),
        actions: [
          if (existing != null)
            TextButton(
              onPressed: () async {
                await ref
                    .read(staffRepositoryProvider)
                    .deleteStaff(existing.id);
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
              final name = nameController.text.trim();
              final phone = phoneController.text.trim();
              final role = roleController.text.trim();
              final salary = double.tryParse(salaryController.text.trim());
              if (name.isEmpty ||
                  phone.isEmpty ||
                  role.isEmpty ||
                  salary == null) {
                _snack('Name, phone, role, and valid salary are required.');
                return;
              }
              final repo = ref.read(staffRepositoryProvider);
              if (existing == null) {
                await repo.addStaff(
                  StaffCompanion.insert(
                    name: name,
                    phone: phone,
                    role: role,
                    salary: salary,
                  ),
                );
              } else {
                await repo.updateStaff(
                  existing.copyWith(
                    name: name,
                    phone: phone,
                    role: role,
                    salary: salary,
                  ),
                );
              }
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(existing == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _showSalaryDialog(StaffData staff) async {
    final amountController = TextEditingController(
      text: staff.salary.toStringAsFixed(0),
    );
    String status = 'PAID';
    DateTime date = DateTime.now();

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocalState) => AlertDialog(
          title: Text('Salary Record - ${staff.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: status,
                items: const [
                  DropdownMenuItem(value: 'PAID', child: Text('PAID')),
                  DropdownMenuItem(value: 'UNPAID', child: Text('UNPAID')),
                ],
                onChanged: (value) =>
                    setLocalState(() => status = value ?? 'PAID'),
                decoration: const InputDecoration(labelText: 'Status'),
              ),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Date'),
                subtitle: Text(DateFormat('dd-MMM-yyyy').format(date)),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    setLocalState(() => date = picked);
                  }
                },
              ),
              const SizedBox(height: 4),
              const Text(
                'Optional advances module is not enabled; record advance as a separate salary/expense entry if needed.',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final amount = double.tryParse(amountController.text.trim());
                if (amount == null) {
                  _snack('Enter a valid amount.');
                  return;
                }
                await ref
                    .read(staffRepositoryProvider)
                    .paySalary(
                      SalariesCompanion.insert(
                        staffId: staff.id,
                        date: date,
                        amount: amount,
                        status: drift.Value(status),
                      ),
                    );
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteStaff(StaffData staff) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Staff'),
            content: Text('Delete ${staff.name}?'),
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
    await ref.read(staffRepositoryProvider).deleteStaff(staff.id);
  }

  Color _attendanceColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.green;
      case 'Leave':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
