// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCategoria _$DataCategoriaFromJson(Map<String, dynamic> json) {
  return DataCategoria(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Categoria.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataCategoriaToJson(DataCategoria instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

Categoria _$CategoriaFromJson(Map<String, dynamic> json) {
  return Categoria(
    id: json['_id'] as String,
    nombre: json['nombre'] as String ?? '',
    descripcion: json['descripcion'] as String ?? '',
    imagen: json['imagen'] as String ?? '',
  );
}

Map<String, dynamic> _$CategoriaToJson(Categoria instance) => <String, dynamic>{
      '_id': instance.id,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'imagen': instance.imagen,
    };
