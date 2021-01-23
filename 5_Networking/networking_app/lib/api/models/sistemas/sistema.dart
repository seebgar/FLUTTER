import 'package:json_annotation/json_annotation.dart';

part 'sistema.g.dart'; // must match the file name

@JsonSerializable(explicitToJson: true)
class DataSistema {
  final bool success;
  final List<Sistema> data;

  const DataSistema({this.success, this.data});

  factory DataSistema.fromJson(Map<String, dynamic> json) =>
      _$DataSistemaFromJson(json);

  Map<String, dynamic> toJson() => _$DataSistemaToJson(this);
}

@JsonSerializable()
class Sistema {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(defaultValue: "")
  final String nombre;
  @JsonKey(defaultValue: "")
  final String descripcion;
  @JsonKey(defaultValue: "")
  final String imagen;

  const Sistema({this.id, this.nombre, this.descripcion, this.imagen});

  factory Sistema.fromJson(Map<String, dynamic> json) =>
      _$SistemaFromJson(json);

  Map<String, dynamic> toJson() => _$SistemaToJson(this);
}
