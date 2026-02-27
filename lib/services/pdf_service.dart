import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart' as p;
import 'package:printing/printing.dart';
import '../data/database.dart';

class PdfService {
  Future<String> generateReceipt({
    required Setting settings,
    required Invoice invoice,
    required List<InvoiceItem> items,
  }) async {
    final pdf = pw.Document();
    final dateStr = DateFormat('dd-MMM-yyyy HH:mm').format(invoice.date);

    // Determine page width based on paper size
    final double width = settings.paperSize == '80mm'
        ? 80 * PdfPageFormat.mm
        : 58 * PdfPageFormat.mm;
    final format = PdfPageFormat(
      width,
      double.infinity,
      marginAll: 5 * PdfPageFormat.mm,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Center(
                child: pw.Text(
                  settings.restaurantName,
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              if ((settings.ownerName ?? '').trim().isNotEmpty)
                pw.Center(
                  child: pw.Text(
                    'Owner: ${settings.ownerName!.trim()}',
                    style: const pw.TextStyle(fontSize: 8),
                  ),
                ),
              if (settings.address != null)
                pw.Center(
                  child: pw.Text(
                    settings.address!,
                    style: const pw.TextStyle(fontSize: 8),
                  ),
                ),
              if (settings.phone != null)
                pw.Center(
                  child: pw.Text(
                    'Phone: ${settings.phone!}',
                    style: const pw.TextStyle(fontSize: 8),
                  ),
                ),
              if ((settings.ownerContact ?? '').trim().isNotEmpty)
                pw.Center(
                  child: pw.Text(
                    'Owner Contact: ${settings.ownerContact!.trim()}',
                    style: const pw.TextStyle(fontSize: 8),
                  ),
                ),
              pw.Divider(),

              // Invoice Info
              pw.Text(
                'Invoice: ${invoice.invoiceNumber}',
                style: const pw.TextStyle(fontSize: 8),
              ),
              pw.Text('Date: $dateStr', style: const pw.TextStyle(fontSize: 8)),
              if (invoice.customerName != null &&
                  invoice.customerName!.isNotEmpty)
                pw.Text(
                  'Customer: ${invoice.customerName}',
                  style: const pw.TextStyle(fontSize: 8),
                ),
              pw.Text(
                'Type: ${invoice.orderType}',
                style: const pw.TextStyle(fontSize: 8),
              ),
              pw.Divider(),

              // Items Header
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.Text(
                      'Item',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      'Qty',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 8,
                      ),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      'Rate',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 8,
                      ),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      'Total',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 8,
                      ),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                ],
              ),
              pw.Divider(thickness: 0.5),

              // Items
              ...items.map(
                (item) => pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 3,
                        child: pw.Text(
                          item.itemName,
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          item.quantity.toString(),
                          style: const pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          item.price.toStringAsFixed(0),
                          style: const pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          (item.quantity * item.price).toStringAsFixed(0),
                          style: const pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              pw.Divider(),

              // Totals
              _buildTotalRow('Subtotal:', invoice.subtotal),
              if (invoice.discount > 0)
                _buildTotalRow('Discount:', -invoice.discount),
              _buildTotalRow('Grand Total:', invoice.grandTotal, isBold: true),
              pw.Divider(thickness: 0.5),
              _buildTotalRow('Received:', invoice.receivedAmount),
              _buildTotalRow('Balance:', invoice.balanceAmount),

              pw.SizedBox(height: 10),
              if (settings.footerNote != null)
                pw.Center(
                  child: pw.Text(
                    settings.footerNote!,
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontStyle: pw.FontStyle.italic,
                    ),
                  ),
                ),
              pw.Center(
                child: pw.Text(
                  'Thank You!',
                  style: const pw.TextStyle(fontSize: 8),
                ),
              ),
            ],
          );
        },
      ),
    );

    final output = await getApplicationDocumentsDirectory();
    final invoicesDir = Directory(p.join(output.path, 'invoices'));
    if (!await invoicesDir.exists()) {
      await invoicesDir.create(recursive: true);
    }

    final file = File(p.join(invoicesDir.path, '${invoice.invoiceNumber}.pdf'));
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }

  Future<void> openPdf(String pdfPath) async {
    final file = File(pdfPath);
    if (!await file.exists()) {
      throw Exception('PDF file not found: $pdfPath');
    }

    if (Platform.isWindows) {
      await Process.run('cmd', ['/c', 'start', '', pdfPath]);
      return;
    }

    // Fallback for Android and other platforms: hand off to system share/viewer.
    final bytes = await file.readAsBytes();
    await Printing.sharePdf(bytes: bytes, filename: p.basename(pdfPath));
  }

  Future<void> sharePdf(String pdfPath) async {
    final file = File(pdfPath);
    if (!await file.exists()) {
      throw Exception('PDF file not found: $pdfPath');
    }
    final bytes = await file.readAsBytes();
    await Printing.sharePdf(bytes: bytes, filename: p.basename(pdfPath));
  }

  Future<void> printPdf(String pdfPath) async {
    final file = File(pdfPath);
    if (!await file.exists()) {
      throw Exception('PDF file not found: $pdfPath');
    }
    final bytes = await file.readAsBytes();
    await Printing.layoutPdf(onLayout: (_) async => bytes);
  }

  pw.Widget _buildTotalRow(String label, double amount, {bool isBold = false}) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 9,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
        pw.Text(
          amount.toStringAsFixed(0),
          style: pw.TextStyle(
            fontSize: 9,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
