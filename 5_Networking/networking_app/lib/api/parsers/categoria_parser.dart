import 'package:networking_app/api/parsers/json_parser.dart';
import 'package:networking_app/api/models/categorias/categoria.dart';

/// ** Object Parser
class CategoriaParser extends JsonParser<DataCategoria>
    with ObjectDecoder<DataCategoria> {
  const CategoriaParser();

  @override
  Future<DataCategoria> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return DataCategoria.fromJson(decoded);
  }
}
