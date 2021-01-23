// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sistema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSistema _$DataSistemaFromJson(Map<String, dynamic> json) {
  return DataSistema(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Sistema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataSistemaToJson(DataSistema instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

Sistema _$SistemaFromJson(Map<String, dynamic> json) {
  return Sistema(
    id: json['_id'] as String,
    nombre: json['nombre'] as String ?? '',
    descripcion: json['descripcion'] as String ?? '',
    imagen: json['imagen'] as String ?? '',
  );
}

Map<String, dynamic> _$SistemaToJson(Sistema instance) => <String, dynamic>{
      '_id': instance.id,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'imagen': instance.imagen,
    };
