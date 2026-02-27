import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class PrinterSetupScreen extends ConsumerStatefulWidget {
  const PrinterSetupScreen({super.key});

  @override
  ConsumerState<PrinterSetupScreen> createState() => _PrinterSetupScreenState();
}

class _PrinterSetupScreenState extends ConsumerState<PrinterSetupScreen> {
  Future<List<BluetoothDevice>>? _devicesFuture;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _devicesFuture = ref.read(printServiceProvider).getBluetoothDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(selectedBluetoothPrinterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Printer Setup'),
        actions: [
          IconButton(onPressed: _refresh, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Printing Mode',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      Platform.isWindows
                          ? 'Windows prints using the generated PDF to any installed printer.'
                          : Platform.isAndroid
                          ? 'Android thermal printing uses Bluetooth ESC/POS (paired devices list below).'
                          : 'Printing is only configured for Android and Windows in this app.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (!Platform.isAndroid) ...[
              const Spacer(),
              const Center(
                child: Text(
                  'No Bluetooth thermal setup is needed on Windows.\nUse Save & Print from POS to print the saved receipt PDF.',
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
            ] else ...[
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _busy
                        ? null
                        : () async {
                            setState(() => _busy = true);
                            try {
                              await ref
                                  .read(printServiceProvider)
                                  .openBluetoothSettings();
                            } catch (e) {
                              _snack('Unable to open Bluetooth settings: $e');
                            } finally {
                              if (mounted) setState(() => _busy = false);
                            }
                          },
                    icon: const Icon(Icons.bluetooth_searching),
                    label: const Text('Open Bluetooth Settings'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: _busy ? null : _refresh,
                    icon: const Icon(Icons.search),
                    label: const Text('Refresh Paired Devices'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Paired Bluetooth Printers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: FutureBuilder<List<BluetoothDevice>>(
                  future: _devicesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Failed to load devices: ${snapshot.error}',
                        ),
                      );
                    }
                    final devices = snapshot.data ?? const <BluetoothDevice>[];
                    if (devices.isEmpty) {
                      return const Center(
                        child: Text(
                          'No paired devices found.\nPair your thermal printer in Android Bluetooth settings, then refresh.',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return ListView.separated(
                      itemCount: devices.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final device = devices[index];
                        final isSelected = selected?.address == device.address;
                        return Card(
                          child: ListTile(
                            leading: Icon(
                              isSelected ? Icons.print : Icons.bluetooth,
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            title: Text(device.name ?? 'Unknown Printer'),
                            subtitle: Text(device.address ?? 'No address'),
                            trailing: Wrap(
                              spacing: 8,
                              children: [
                                OutlinedButton(
                                  onPressed: _busy
                                      ? null
                                      : () => _selectPrinter(device),
                                  child: Text(
                                    isSelected ? 'Selected' : 'Select',
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: _busy
                                      ? null
                                      : () => _testPrinter(device),
                                  child: const Text('Test Print'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _selectPrinter(BluetoothDevice device) {
    ref.read(selectedBluetoothPrinterProvider.notifier).state = device;
    _snack('Selected printer: ${device.name ?? device.address}');
  }

  Future<void> _testPrinter(BluetoothDevice device) async {
    setState(() => _busy = true);
    try {
      ref.read(selectedBluetoothPrinterProvider.notifier).state = device;
      await ref.read(printServiceProvider).testPrintBluetooth(device);
      _snack('Test print sent.');
    } catch (e) {
      _snack('Test print failed: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
