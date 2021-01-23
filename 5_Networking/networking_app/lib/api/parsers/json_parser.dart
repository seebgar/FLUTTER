library json_parser;

export 'categoria_parser.dart';
export 'object_decoder.dart';

/// Json Object Parser type T
abstract class JsonParser<T> {
  const JsonParser();
  Future<T> parseFromJson(String json);
}
