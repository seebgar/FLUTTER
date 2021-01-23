import 'package:networking_app/api/parsers/json_parser.dart';
import 'package:networking_app/api/models/sistemas/sistema.dart';

/// ** Object Parser
class SistemaParser extends JsonParser<DataSistema>
    with ObjectDecoder<DataSistema> {
  const SistemaParser();

  @override
  Future<DataSistema> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return DataSistema.fromJson(decoded);
  }
}
