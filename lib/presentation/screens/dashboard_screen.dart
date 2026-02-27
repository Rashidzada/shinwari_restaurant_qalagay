import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final invoices = ref.watch(invoicesProvider);

    return Scaffold(
      appBar: AppBar(
        title: settings.when(
          data: (s) => Text(
            s?.restaurantName ?? 'Shinwari Restaurant',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Shinwari Restaurant'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _showPinEntry(context, ref, '/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(ref, settings, invoices),
            const SizedBox(height: 24),
            _buildActionGrid(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(
    WidgetRef ref,
    AsyncValue<Setting?> settings,
    AsyncValue<List<Invoice>> invoices,
  ) {
    final todayStats = invoices.when(
      data: (rows) => _todayStats(rows),
      loading: () =>
          const _DashboardStats(todaySales: null, invoiceCount: null),
      error: (_, __) =>
          const _DashboardStats(todaySales: null, invoiceCount: null),
    );

    final restaurantName = settings.maybeWhen(
      data: (s) => s?.restaurantName ?? 'Shinwari Restaurant Qalagay',
      orElse: () => 'Shinwari Restaurant Qalagay',
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade900, Colors.green.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome To',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            restaurantName,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildStatCard(
                'Today Sales',
                todayStats.todaySales == null
                    ? '...'
                    : 'Rs. ${todayStats.todaySales!.toStringAsFixed(0)}',
                Icons.trending_up,
              ),
              _buildStatCard(
                'Invoices',
                todayStats.invoiceCount?.toString() ?? '...',
                Icons.receipt_long,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 240),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionGrid(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> actions = [
      {
        'title': 'New Bill',
        'icon': Icons.add_shopping_cart,
        'color': Colors.orange,
        'route': '/pos',
      },
      {
        'title': 'Invoice History',
        'icon': Icons.history,
        'color': Colors.blue,
        'route': '/invoices',
      },
      {
        'title': 'Menu Items',
        'icon': Icons.restaurant_menu,
        'color': Colors.red,
        'route': '/menu',
      },
      {
        'title': 'Expenses',
        'icon': Icons.money_off,
        'color': Colors.purple,
        'route': '/expenses',
      },
      {
        'title': 'Staff Management',
        'icon': Icons.people,
        'color': Colors.teal,
        'route': '/staff',
      },
      {
        'title': 'Suppliers',
        'icon': Icons.local_shipping,
        'color': Colors.brown,
        'route': '/suppliers',
      },
      {
        'title': 'Printer Setup',
        'icon': Icons.print,
        'color': Colors.deepOrange,
        'route': '/printer-setup',
      },
      {
        'title': 'Reports',
        'icon': Icons.analytics,
        'color': Colors.indigo,
        'route': '/reports',
      },
      {
        'title': 'Settings',
        'icon': Icons.settings_applications,
        'color': Colors.grey,
        'route': '/settings_admin',
      },
      {
        'title': 'About App',
        'icon': Icons.info_outline,
        'color': Colors.green,
        'route': '/about-app',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width >= 1200
            ? 4
            : width >= 800
            ? 3
            : 2;
        final ratio = width < 380
            ? 0.95
            : width < 500
            ? 1.05
            : 1.15;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: ratio,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final action = actions[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (action['route'] == '/settings_admin') {
                  _showPinEntry(context, ref, '/settings');
                } else if (action['route'] == '/reports') {
                  _showPinEntry(context, ref, '/reports');
                } else {
                  Navigator.pushNamed(context, action['route']);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: (action['color'] as Color).withValues(
                          alpha: 0.12,
                        ),
                        child: Icon(
                          action['icon'] as IconData,
                          color: action['color'] as Color,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        action['title'] as String,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showPinEntry(BuildContext context, WidgetRef ref, String targetRoute) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Admin PIN Required'),
        content: TextField(
          controller: controller,
          obscureText: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Enter 4-digit PIN'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final verified = await ref
                  .read(settingsRepositoryProvider)
                  .verifyPin(controller.text);
              if (verified) {
                if (context.mounted) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, targetRoute);
                }
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Invalid PIN')));
                }
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class _DashboardStats {
  final double? todaySales;
  final int? invoiceCount;

  const _DashboardStats({required this.todaySales, required this.invoiceCount});
}

_DashboardStats _todayStats(List<Invoice> invoices) {
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, now.day);
  final end = start.add(const Duration(days: 1));
  final today = invoices
      .where((i) => !i.date.isBefore(start) && i.date.isBefore(end))
      .toList();

  final sales = today.fold<double>(0, (sum, i) => sum + i.grandTotal);
  return _DashboardStats(todaySales: sales, invoiceCount: today.length);
}
