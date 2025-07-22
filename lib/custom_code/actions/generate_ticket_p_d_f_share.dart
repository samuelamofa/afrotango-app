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
import 'package:share_plus/share_plus.dart';

Future<void> generateTicketPDFShare(String eventName, String userName,
    String date, String time, String place, String ticketID) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(eventName,
              style:
                  pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text('Name: $userName'),
          pw.Text('Date: $date'),
          pw.Text('Time: $time'),
          pw.Text('Place: $place'),
          pw.Text('Ticket ID: $ticketID'),
          pw.SizedBox(height: 20),
          pw.Text('Scan this QR code at the entrance',
              style: pw.TextStyle(fontSize: 16)),
          pw.SizedBox(height: 10),
          pw.BarcodeWidget(
            data: ticketID,
            barcode: pw.Barcode.qrCode(),
            width: 100,
            height: 100,
          ),
        ],
      ),
    ),
  );

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/ticket.pdf');
  await file.writeAsBytes(await pdf.save());

  print("PDF saved to: ${file.path}");
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
