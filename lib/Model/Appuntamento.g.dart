// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Appuntamento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appuntamento _$AppuntamentoFromJson(Map<String, dynamic> json) => Appuntamento(
      json['id'] as int,
      DateTime.parse(json['data'] as String),
      DateTime.parse(json['ora'] as String),
      Cliente.fromJson(json['cliente'] as Map<String, dynamic>),
      Dipendente.fromJson(json['dipendente'] as Map<String, dynamic>),
      Titolare.fromJson(json['titolare'] as Map<String, dynamic>),
      Servizio.fromJson(json['servizio'] as Map<String, dynamic>),
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
