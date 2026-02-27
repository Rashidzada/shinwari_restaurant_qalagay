import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  static const _developerName = 'Rashid Zada Software Eng';
  static const _email = 'rashidzada6@gmail.com';
  static const _phone = '03470983567';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 850;
          final content = [
            _heroCard(context),
            const SizedBox(height: 14),
            _contactCard(context),
            const SizedBox(height: 14),
            _aboutDeveloperCard(context),
            const SizedBox(height: 14),
            _aboutAppCard(context),
          ];

          if (!isWide) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(children: content),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      _heroCard(context),
                      const SizedBox(height: 14),
                      _aboutDeveloperCard(context),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      _contactCard(context),
                      const SizedBox(height: 14),
                      _aboutAppCard(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _heroCard(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0B4D1F), Color(0xFF1B5E20), Color(0xFF2E7D32)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Center(
                    child: Text(
                      'RZ',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _developerName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Developer of Shinwari Restaurant Qalagay POS App',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                _Badge(text: 'Flutter'),
                _Badge(text: 'Android APK'),
                _Badge(text: 'Windows EXE'),
                _Badge(text: 'Offline POS'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Developer Contact',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _contactTile(
              context,
              icon: Icons.email_outlined,
              title: 'Email',
              value: _email,
              copyValue: _email,
            ),
            const SizedBox(height: 8),
            _contactTile(
              context,
              icon: Icons.phone_android,
              title: 'Contact',
              value: _phone,
              copyValue: _phone,
            ),
            const SizedBox(height: 8),
            _contactTile(
              context,
              icon: Icons.chat_bubble_outline,
              title: 'WhatsApp',
              value: _phone,
              copyValue: _phone,
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required String copyValue,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFF1B5E20).withValues(alpha: 0.10),
            child: Icon(icon, size: 18, color: const Color(0xFF1B5E20)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                SelectableText(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Copy $title',
            onPressed: () => _copy(context, copyValue, '$title copied'),
            icon: const Icon(Icons.copy_rounded),
          ),
        ],
      ),
    );
  }

  Widget _aboutDeveloperCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About Developer',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Rashid Zada is a software engineer and the developer of this restaurant POS & management application. '
              'This system is designed for practical day-to-day restaurant operations with offline billing, invoices, '
              'reports, staff and supplier management, and printable receipts for Android and Windows.',
              style: TextStyle(height: 1.35),
            ),
          ],
        ),
      ),
    );
  }

  Widget _aboutAppCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About This App',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _featureRow(Icons.point_of_sale, 'Offline-first POS billing'),
            _featureRow(Icons.receipt_long, 'Invoice history + PDF reprint'),
            _featureRow(
              Icons.analytics_outlined,
              'Sales and profit/loss reports',
            ),
            _featureRow(Icons.groups_outlined, 'Staff attendance and salaries'),
            _featureRow(
              Icons.local_shipping_outlined,
              'Supplier and item management',
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFA000).withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFFFA000).withValues(alpha: 0.25),
                ),
              ),
              child: const Text(
                'Created and maintained by Rashid Zada Software Eng.',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(icon, size: 18, color: const Color(0xFF1B5E20)),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Future<void> _copy(BuildContext context, String value, String message) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _Badge extends StatelessWidget {
  final String text;

  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
