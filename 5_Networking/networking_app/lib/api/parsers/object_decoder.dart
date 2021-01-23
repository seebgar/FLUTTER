import 'dart:convert';

import 'json_parser.dart';

/// Decodes from JSON response
/// with format Map<String, dynamic>
mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) =>
      jsonDecode(json) as Map<String, dynamic>;
}

/// Decodes from JSON response
/// with format List<dynamic>
mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) =>
      jsonDecode(json) as List<dynamic>;
}
