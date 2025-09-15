// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQrCode extends StatefulWidget {
  const CreateQrCode({
    super.key,
    this.width,
    this.height,
    required this.qrcodedata,
  });

  final double? width;
  final double? height;
  final String qrcodedata;

  @override
  State<CreateQrCode> createState() => _CreateQrCodeState();
}

class _CreateQrCodeState extends State<CreateQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: QrImageView(
                data: widget.qrcodedata,
                version: QrVersions.auto,
                size: widget.width ?? 200.0,
                backgroundColor: Colors.white,
                gapless: true,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color.fromARGB(255, 167, 125, 0), // Gold
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.circle,
                  color: Color.fromARGB(255, 167, 125, 0), // Gold
                ),
                errorStateBuilder: (context, error) =>
                    const Center(child: Text('Error generating QR code')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
