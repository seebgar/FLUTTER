import 'package:json_annotation/json_annotation.dart';

part 'categoria.g.dart'; // must match the file name

@JsonSerializable(explicitToJson: true)
class DataCategoria {
  final bool success;
  final List<Categoria> data;

  const DataCategoria({this.success, this.data});

  factory DataCategoria.fromJson(Map<String, dynamic> json) =>
      _$DataCategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoriaToJson(this);
}

@JsonSerializable()
class Categoria {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(defaultValue: "")
  final String nombre;
  @JsonKey(defaultValue: "")
  final String descripcion;
  @JsonKey(defaultValue: "")
  final String imagen;

  const Categoria({this.id, this.nombre, this.descripcion, this.imagen});

  factory Categoria.fromJson(Map<String, dynamic> json) =>
      _$CategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaToJson(this);
}
