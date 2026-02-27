import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../providers/providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _restaurantNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _ownerCnicController = TextEditingController();
  final _ownerContactController = TextEditingController();
  final _signaturePathController = TextEditingController();
  final _logoPathController = TextEditingController();
  final _ownerPhotoPathController = TextEditingController();
  final _footerController = TextEditingController();
  final _pinController = TextEditingController();
  String _paperSize = '58mm';
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _restaurantNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _ownerNameController.dispose();
    _ownerCnicController.dispose();
    _ownerContactController.dispose();
    _signaturePathController.dispose();
    _logoPathController.dispose();
    _ownerPhotoPathController.dispose();
    _footerController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    final settings = await ref.read(settingsRepositoryProvider).getSettings();
    if (!mounted) return;
    if (settings != null) {
      _restaurantNameController.text = settings.restaurantName;
      _addressController.text = settings.address ?? '';
      _phoneController.text = settings.phone ?? '';
      _ownerNameController.text = settings.ownerName ?? '';
      _ownerCnicController.text = settings.ownerCnic ?? '';
      _ownerContactController.text = settings.ownerContact ?? '';
      _signaturePathController.text = settings.ownerSignature ?? '';
      _logoPathController.text = settings.logoPath ?? '';
      _ownerPhotoPathController.text = settings.ownerPhotoPath ?? '';
      _footerController.text = settings.footerNote ?? '';
      _pinController.text = settings.adminPin;
      _paperSize = settings.paperSize;
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Settings (Admin)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionCard(
              title: 'Restaurant',
              children: [
                _textField(_restaurantNameController, 'Restaurant Name'),
                _textField(_addressController, 'Address'),
                _textField(_phoneController, 'Phone'),
              ],
            ),
            const SizedBox(height: 12),
            _sectionCard(
              title: 'Owner Details',
              children: [
                _textField(_ownerNameController, 'Owner Name'),
                _textField(_ownerCnicController, 'Owner CNIC'),
                _textField(_ownerContactController, 'Owner Contact Number'),
                _textField(
                  _signaturePathController,
                  'Signature Image Path / File',
                ),
                _textField(_logoPathController, 'Logo Image Path / File'),
                _textField(
                  _ownerPhotoPathController,
                  'Owner Photo Path / File',
                ),
                const SizedBox(height: 4),
                Text(
                  'Tip: Use a valid local file path for images. These fields are stored for receipt/branding usage.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _sectionCard(
              title: 'Receipt & Security',
              children: [
                DropdownButtonFormField<String>(
                  value: _paperSize,
                  decoration: const InputDecoration(
                    labelText: 'Receipt Paper Size',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: '58mm', child: Text('58mm')),
                    DropdownMenuItem(value: '80mm', child: Text('80mm')),
                  ],
                  onChanged: (value) =>
                      setState(() => _paperSize = value ?? '58mm'),
                ),
                const SizedBox(height: 12),
                _textField(_footerController, 'Footer Note'),
                _textField(
                  _pinController,
                  'Admin PIN',
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.print),
                title: const Text('Printer Setup'),
                subtitle: const Text(
                  'Scan/select Bluetooth thermal printer and send test print',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/printer-setup'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About App'),
                subtitle: const Text(
                  'Developer profile and app creator details',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/about-app'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saving ? null : _saveSettings,
                icon: _saving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: const Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _textField(
    TextEditingController controller,
    String label, {
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  drift.Value<String?> _nullableText(TextEditingController controller) {
    final text = controller.text.trim();
    return drift.Value(text.isEmpty ? null : text);
  }

  Future<void> _saveSettings() async {
    final pin = _pinController.text.trim();
    if (pin.length < 4) {
      _snack('Admin PIN must be at least 4 digits/characters.');
      return;
    }

    setState(() => _saving = true);
    try {
      await ref
          .read(settingsRepositoryProvider)
          .updateSettings(
            SettingsCompanion(
              restaurantName: drift.Value(
                _restaurantNameController.text.trim().isEmpty
                    ? 'Shinwari Restaurant Qalagay'
                    : _restaurantNameController.text.trim(),
              ),
              address: _nullableText(_addressController),
              phone: _nullableText(_phoneController),
              ownerName: _nullableText(_ownerNameController),
              ownerCnic: _nullableText(_ownerCnicController),
              ownerContact: _nullableText(_ownerContactController),
              ownerSignature: _nullableText(_signaturePathController),
              logoPath: _nullableText(_logoPathController),
              ownerPhotoPath: _nullableText(_ownerPhotoPathController),
              footerNote: _nullableText(_footerController),
              paperSize: drift.Value(_paperSize),
              adminPin: drift.Value(pin),
            ),
          );
      _snack('Settings saved');
    } catch (e) {
      _snack('Failed to save settings: $e');
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
