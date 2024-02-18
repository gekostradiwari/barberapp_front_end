// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Appuntamento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appuntamento _$AppuntamentoFromJson(Map<String, dynamic> json) => Appuntamento(
      json['id'] as int,
      DateTime.parse(json['data'] as String),
      DateTime.parse(json['ora'] as String),
      json['cliente'] as int?,
      json['dipendente'] as int?,
      json['titolare'] as int?,
      json['servizio'] as int?,
    );

Map<String, dynamic> _$AppuntamentoToJson(Appuntamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data.toIso8601String(),
      'ora': instance.ora.toIso8601String(),
      'cliente': instance.cliente,
      'dipendente': instance.dipendente,
      'titolare': instance.titolare,
      'servizio': instance.servizio,
    };
