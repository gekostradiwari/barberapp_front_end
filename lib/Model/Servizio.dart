import 'dart:core';
import 'package:barberapp_front_end/Model/Titolare.dart';
import 'package:barberapp_front_end/Model/Appuntamento.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Servizio.g.dart';

@JsonSerializable()
class Servizio {
  late int id;
  late String tipo;
  @DoubleConverter()
  late double costo;
  late List<Appuntamento> appuntamenti;
  late Titolare titolare;

  Servizio(this.id, this.tipo, this.costo, this.appuntamenti, this.titolare);

  factory Servizio.fromJson(Map<String, dynamic> json) =>
      _$ServizioFromJson(json);
  Map<String, dynamic> toJson() => _$ServizioToJson(this);

  int get _id => id;

  set _id(int value) {
    id = value;
  }

  String get _tipo => tipo;

  set _tipo(String value) {
    tipo = value;
  }

  double get _costo => costo;

  set _costo(double value) {
    costo = value;
  }

  List<Appuntamento> get _appuntamenti => appuntamenti;

  set _appuntamenti(List<Appuntamento> value) {
    appuntamenti = value;
  }

  Titolare get _titolare => titolare;

  set _titolare(Titolare value) {
    titolare = value;
  }

  @override
  String toString() {
    return 'Servizio{id: $id, tipo: $tipo, costo: $costo, appuntamenti: $appuntamenti, titolare: $titolare}';
  }
}

class DoubleConverter implements JsonConverter<double, dynamic> {
  const DoubleConverter();
  @override
  double fromJson(dynamic json) {
    if (json is int) {
      return json.toDouble();
    } else if (json is double) {
      return json;
    }
    throw ArgumentError.value(
        json, 'json', 'Invalid type for conversion to double');
  }

  @override
  dynamic toJson(double object) {
    return object;
  }
}
