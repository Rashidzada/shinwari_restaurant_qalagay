import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

import '../data/database.dart';

class PrintService {
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;

  Future<List<BluetoothDevice>> getBluetoothDevices() async {
    if (kIsWeb || !Platform.isAndroid) return [];
    return _bluetooth.getBondedDevices();
  }

  Future<void> openBluetoothSettings() async {
    _ensureAndroid();
    await _bluetooth.openSettings;
  }

  Future<void> connectBluetoothPrinter(BluetoothDevice device) async {
    _ensureAndroid();
    final isConnected = await _bluetooth.isDeviceConnected(device);
    if (isConnected == true) return;
    await _bluetooth.connect(device);
  }

  Future<void> disconnectBluetoothPrinter() async {
    if (kIsWeb || !Platform.isAndroid) return;
    final isConnected = await _bluetooth.isConnected;
    if (isConnected == true) {
      await _bluetooth.disconnect();
    }
  }

  Future<void> testPrintBluetooth(BluetoothDevice device) async {
    _ensureAndroid();
    await connectBluetoothPrinter(device);
    await _bluetooth.printCustom('Shinwari Restaurant Qalagay', 2, 1);
    await _bluetooth.printCustom('Bluetooth Printer Test', 1, 1);
    await _bluetooth.printCustom(
      DateFormat('dd-MMM-yyyy HH:mm').format(DateTime.now()),
      1,
      1,
    );
    await _bluetooth.printNewLine();
    await _bluetooth.printCustom('Test successful', 1, 0);
    await _bluetooth.printNewLine();
    await _bluetooth.printNewLine();
  }

  Future<void> printThermalReceipt({
    required Setting settings,
    required Invoice invoice,
    required List<InvoiceItem> items,
    required BluetoothDevice device,
  }) async {
    _ensureAndroid();
    await connectBluetoothPrinter(device);

    final dateStr = DateFormat('dd-MMM-yyyy HH:mm').format(invoice.date);
    final lineWidth = settings.paperSize == '80mm' ? 46 : 32;

    await _bluetooth.printCustom(settings.restaurantName, 2, 1);
    if ((settings.ownerName ?? '').trim().isNotEmpty) {
      await _bluetooth.printCustom(
        'Owner: ${settings.ownerName!.trim()}',
        1,
        1,
      );
    }
    if ((settings.phone ?? '').trim().isNotEmpty) {
      await _bluetooth.printCustom('Phone: ${settings.phone!.trim()}', 1, 1);
    }
    if ((settings.ownerContact ?? '').trim().isNotEmpty) {
      await _bluetooth.printCustom(
        'Owner Contact: ${settings.ownerContact!.trim()}',
        1,
        1,
      );
    }
    if ((settings.address ?? '').trim().isNotEmpty) {
      await _bluetooth.printCustom(settings.address!.trim(), 1, 1);
    }
    await _bluetooth.printCustom(_line(lineWidth), 0, 0);
    await _bluetooth.printLeftRight('Invoice', invoice.invoiceNumber, 0);
    await _bluetooth.printLeftRight('Date', dateStr, 0);
    await _bluetooth.printLeftRight('Type', invoice.orderType, 0);
    if ((invoice.customerName ?? '').trim().isNotEmpty) {
      await _bluetooth.printLeftRight(
        'Customer',
        invoice.customerName!.trim(),
        0,
      );
    }
    await _bluetooth.printCustom(_line(lineWidth), 0, 0);
    await _bluetooth.print4Column('Item', 'Qty', 'Rate', 'Amt', 0);
    await _bluetooth.printCustom(_line(lineWidth), 0, 0);

    for (final item in items) {
      final maxName = lineWidth - 4;
      final itemName = item.itemName.length > maxName
          ? '${item.itemName.substring(0, maxName - 3)}...'
          : item.itemName;
      await _bluetooth.printCustom(itemName, 0, 0);
      await _bluetooth.print4Column(
        '',
        item.quantity.toString(),
        item.price.toStringAsFixed(0),
        (item.quantity * item.price).toStringAsFixed(0),
        0,
      );
    }

    await _bluetooth.printCustom(_line(lineWidth), 0, 0);
    await _bluetooth.printLeftRight(
      'Subtotal',
      invoice.subtotal.toStringAsFixed(0),
      1,
    );
    if (invoice.discount > 0) {
      await _bluetooth.printLeftRight(
        'Discount',
        '-${invoice.discount.toStringAsFixed(0)}',
        1,
      );
    }
    await _bluetooth.printLeftRight(
      'Grand Total',
      invoice.grandTotal.toStringAsFixed(0),
      1,
    );
    await _bluetooth.printLeftRight(
      'Received',
      invoice.receivedAmount.toStringAsFixed(0),
      1,
    );
    await _bluetooth.printLeftRight(
      'Balance',
      invoice.balanceAmount.toStringAsFixed(0),
      1,
    );
    await _bluetooth.printLeftRight('Status', invoice.status, 1);
    await _bluetooth.printNewLine();
    if ((settings.footerNote ?? '').trim().isNotEmpty) {
      await _bluetooth.printCustom(settings.footerNote!.trim(), 1, 1);
    }
    await _bluetooth.printCustom('Thank You!', 1, 1);
    await _bluetooth.printNewLine();
    await _bluetooth.printNewLine();
  }

  Future<void> printReceipt({
    required String pdfPath,
    BluetoothDevice? device,
  }) async {
    final file = File(pdfPath);
    final bytes = await file.readAsBytes();

    if (Platform.isWindows) {
      await Printing.layoutPdf(onLayout: (_) async => bytes);
      return;
    }

    if (Platform.isAndroid && device != null) {
      // PDF-to-thermal rastering is not implemented here. Keep the saved PDF and
      // use sharing fallback for history prints; POS flow uses `printThermalReceipt`.
      await Printing.sharePdf(
        bytes: bytes,
        filename: file.uri.pathSegments.last,
      );
      return;
    }

    await Printing.sharePdf(bytes: bytes, filename: file.uri.pathSegments.last);
  }

  void _ensureAndroid() {
    if (kIsWeb || !Platform.isAndroid) {
      throw Exception(
        'Bluetooth thermal printing is only supported on Android.',
      );
    }
  }

  String _line(int width) => List.filled(width, '-').join();
}
