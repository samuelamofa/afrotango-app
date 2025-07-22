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

import 'package:path/path.dart' as p;
import 'package:audioplayers/audioplayers.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async'; // Required for the Completer
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchaduio(
  String promptText,
  String? apiKey,
  String vioce,
) async {
  // Ensure the API key is provided
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('API key is required.');
  }

  // Set up the POST request headers.
  Map<String, String> headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  // Set up the POST request body.
  String body = json.encode(
      {'model': 'tts-1', 'input': promptText, 'voice': vioce, 'speed': '1'});

  // Make the POST request to fetch the speech audio.
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/audio/speech'),
    headers: headers,
    body: body,
  );

  // Handle the response
  if (response.statusCode == 200) {
    // Decode the response to get audio data (assuming it's in binary format).
    Uint8List audioBytes = response.bodyBytes;
    final player = AudioPlayer();
    await player.play(UrlSource(
        'data:audio/mp3;base64,${base64.encode(response.bodyBytes)}'));
    // Upload the audio to Firebase Storage.
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = 'speech_${DateTime.now().millisecondsSinceEpoch}.mp3';
    Reference ref = storage.ref().child('audio_files').child(fileName);

    // Upload the audio file.
    UploadTask uploadTask =
        ref.putData(audioBytes, SettableMetadata(contentType: 'audio/mpeg'));

    // Wait for the upload to complete.
    TaskSnapshot snapshot = await uploadTask;

    // Get the download URL.
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  } else {
    throw Exception(
        'Failed to fetch audio: ${response.statusCode} ${response.reasonPhrase}');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
