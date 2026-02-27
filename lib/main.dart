import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/screens/pos_screen.dart';
import 'presentation/screens/menu_management_screen.dart';
import 'presentation/screens/settings_screen.dart';
import 'presentation/screens/expense_screen.dart';
import 'presentation/screens/staff_management_screen.dart';
import 'presentation/screens/reports_screen.dart';
import 'presentation/screens/invoice_history_screen.dart';
import 'presentation/screens/supplier_management_screen.dart';
import 'presentation/screens/printer_setup_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/about_app_screen.dart';
import 'services/seeder_service.dart';
import 'presentation/providers/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const ShinwariPosApp(),
    ),
  );

  unawaited(_bootstrapApp(container));
}

Future<void> _bootstrapApp(ProviderContainer container) async {
  try {
    final db = container.read(databaseProvider);
    await SeederService.seedDefaultData(db);
  } catch (e, st) {
    debugPrint('Bootstrap error: $e');
    debugPrintStack(stackTrace: st);
  }
}

class ShinwariPosApp extends StatelessWidget {
  const ShinwariPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1B5E20),
        primary: const Color(0xFF1B5E20),
        secondary: const Color(0xFFFFA000),
      ),
      fontFamily: defaultTargetPlatform == TargetPlatform.windows
          ? 'Segoe UI'
          : null,
    );

    return MaterialApp(
      title: 'Shinwari Restaurant POS',
      debugShowCheckedModeBanner: false,
      theme: base.copyWith(
        scaffoldBackgroundColor: const Color(0xFFF4F3EE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1B5E20),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: base.textTheme.copyWith(
          headlineSmall: base.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1C1C1C),
          ),
          titleLarge: base.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1C1C1C),
          ),
          titleMedium: base.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1C1C1C),
          ),
          bodyLarge: base.textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF222222),
          ),
          bodyMedium: base.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF2A2A2A),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shadowColor: Colors.black.withValues(alpha: 0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Color(0xFF404040)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF1B5E20), width: 1.4),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Color(0xFF1F1F1F),
          iconColor: Color(0xFF1B5E20),
        ),
        chipTheme: base.chipTheme.copyWith(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F1F1F),
          ),
          secondaryLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          backgroundColor: Colors.white,
          selectedColor: const Color(0xFF2E7D32),
          disabledColor: Colors.grey.shade200,
          checkmarkColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF1B5E20),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF1B5E20),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/pos': (context) => const PosScreen(),
        '/menu': (context) => const MenuManagementScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/expenses': (context) => const ExpenseScreen(),
        '/staff': (context) => const StaffManagementScreen(),
        '/reports': (context) => const ReportsScreen(),
        '/invoices': (context) => const InvoiceHistoryScreen(),
        '/suppliers': (context) => const SupplierManagementScreen(),
        '/printer-setup': (context) => const PrinterSetupScreen(),
        '/about-app': (context) => const AboutAppScreen(),
      },
    );
  }
}
