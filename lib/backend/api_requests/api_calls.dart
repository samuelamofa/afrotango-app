import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetResponseCall {
  static Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? language = '',
    String? promt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "You are a translation engine. Your task is to translate text from one language to another accurately. Always return only the translated text — no explanations, no notes, and no additional comments. Maintain the tone, style, and formatting of the original input as closely as possible."
    },
    {
      "role": "user",
      "content": "Translate the following text ${escapeStringForJson(promt)} to ${escapeStringForJson(language)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetResponse',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class TranslateCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? model = 'gpt-4o-transcribe',
    String? rompt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'translate',
      apiUrl: 'https://api.openai.com/v1/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
        'model': model,
        'prompt': rompt,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
