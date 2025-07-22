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

import 'dart:async'; // Required for the Completer
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

Future<int> fetchSpeechAndPlay(
  String promptText,
  String? apiKey,
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
      {'model': 'tts-1', 'input': promptText, 'voice': 'nova', 'speed': '1'});

  // Make the POST request to fetch the speech audio.
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/audio/speech'),
    headers: headers,
    body: body,
  );

  // Handle the response
  if (response.statusCode == 200) {
    // Decode the audio bytes
    Uint8List audioBytes = response.bodyBytes;

    // Create an audio player instance
    final player = AudioPlayer();

    // Load and play the audio from memory
    await player.play(BytesSource(audioBytes));

    // Wait until the audio completes playing
    Completer<int> durationCompleter = Completer<int>();

    player.onDurationChanged.listen((Duration duration) {
      int durationMs = duration.inMilliseconds;
      durationCompleter.complete(durationMs);
    });

    return durationCompleter.future;
  } else {
    // If the server did not return a "200 OK response",
    // throw an exception
    throw Exception(
        'Failed to generate speech. Status code: ${response.statusCode}');
  }
}
