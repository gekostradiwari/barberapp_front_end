import 'dart:core';
import 'package:barberapp_front_end/Model/Cliente.dart';
import 'package:barberapp_front_end/Model/Dipendente.dart';
import 'package:barberapp_front_end/Model/Titolare.dart';
import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Appuntamento.g.dart';

@JsonSerializable()
class Appuntamento {
  late int id;
  late DateTime data;
  late DateTime ora;
  late int? cliente;
  late int? dipendente;
  late int? titolare;
  late int? servizio;

  Appuntamento(this.id, this.data, this.ora, this.cliente, this.dipendente,
      this.titolare, this.servizio);

  factory Appuntamento.fromJson(Map<String, dynamic> json) =>
      _$AppuntamentoFromJson(json);
  Map<String, dynamic> toJson() => _$AppuntamentoToJson(this);

  int get _id => id;

  set _id(int value) {
    id = value;
  }

  DateTime get _data => data;

  set _data(DateTime value) {
    data = value;
  }

  DateTime get _ora => ora;

  set _ora(DateTime value) {
    ora = value;
  }

  int? get _cliente => cliente;

  set _cliente(int? value) {
    cliente = value;
  }

  int? get _dipendente => dipendente;

  set _dipendente(int? value) {
    dipendente = value;
  }

  int? get _titolare => titolare;

  set _titolare(int? value) {
    titolare = value;
  }

  int? get _servizio => servizio;

  set _servizio(int? value) {
    servizio = value;
  }

  bool isActive() => DateTime.now().toUtc().millisecond > (data.millisecond + _hourMillisecond);


  int get _hourMillisecond => ora.millisecond - DateTime(ora.year, ora.month,ora.day).millisecond;

  @override
  String toString() {
    return 'Appuntamento{id: $id, data: $data, ora: $ora, cliente: $cliente, dipendente: $dipendente, titolare: $titolare, servizio: $servizio}';
  }
}
