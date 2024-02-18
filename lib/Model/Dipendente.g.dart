// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Dipendente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dipendente _$DipendenteFromJson(Map<String, dynamic> json) => Dipendente(
      json['id'] as int,
      json['nome'] as String,
      json['cognome'] as String,
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$DipendenteToJson(Dipendente instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cognome': instance.cognome,
      'email': instance.email,
      'password': instance.password,
    };
