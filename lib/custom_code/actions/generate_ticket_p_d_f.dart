// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';

Future<void> generateTicketPDF(String eventName, String userName, String date,
    String time, String place, String ticketID) async {
  try {
    final pdf = pw.Document();

    // Define a custom theme
    final pw.TextStyle titleStyle =
        pw.TextStyle(fontSize: 26, fontWeight: pw.FontWeight.bold);
    final pw.TextStyle subtitleStyle =
        pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold);
    final pw.TextStyle textStyle = pw.TextStyle(fontSize: 14);

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(20),
        build: (pw.Context context) => pw.Container(
          padding: pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey, width: 2),
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              // Event Banner
              pw.Container(
                width: double.infinity,
                height: 80,
                decoration: pw.BoxDecoration(
                  color: PdfColors.blueAccent,
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                alignment: pw.Alignment.center,
                child: pw.Text(
                  eventName,
                  style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white),
                ),
              ),
              pw.SizedBox(height: 20),

              // Ticket Details
              pw.Text("🎟 Event Ticket", style: titleStyle),
              pw.SizedBox(height: 10),

              pw.Divider(),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("👤 Name:", style: subtitleStyle),
                  pw.Text(userName, style: textStyle),
                ],
              ),
              pw.SizedBox(height: 8),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("📅 Date:", style: subtitleStyle),
                  pw.Text(date, style: textStyle),
                ],
              ),
              pw.SizedBox(height: 8),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("⏰ Time:", style: subtitleStyle),
                  pw.Text(time, style: textStyle),
                ],
              ),
              pw.SizedBox(height: 8),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("📍 Venue:", style: subtitleStyle),
                  pw.Text(place, style: textStyle),
                ],
              ),
              pw.SizedBox(height: 8),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("🎫 Ticket ID:", style: subtitleStyle),
                  pw.Text(ticketID, style: textStyle),
                ],
              ),
              pw.SizedBox(height: 20),

              pw.Divider(),

              // QR Code Section
              pw.Text(
                "📌 Scan this QR code at the entrance",
                style: subtitleStyle,
              ),
              pw.SizedBox(height: 10),

              pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.blue, width: 2),
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                padding: pw.EdgeInsets.all(10),
                child: pw.BarcodeWidget(
                  data: ticketID,
                  barcode: pw.Barcode.qrCode(),
                  width: 120,
                  height: 120,
                ),
              ),

              pw.SizedBox(height: 20),

              pw.Text(
                "Thank you for attending!",
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );

    final pdfSaved = await pdf.save();

    // Generate unique file name
    final now = DateTime.now();
    final fileName =
        '${now.year}-${now.month}-${now.day}_${now.hour}-${now.minute}-${now.second}.pdf';

    // Set directory for Firebase Storage
    String directoryPath = '/users/' + currentUserUid + '/pdfs';
    final storagePath = '$directoryPath/$fileName';

    // Save to Firebase
    final downloadUrl = await uploadData(storagePath, pdfSaved);
    FFAppState().downloadurl = downloadUrl ?? '';

    // Print the PDF
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfSaved);
  } catch (e) {
    print("⚠️ Error generating ticket PDF: $e");
  }
}
