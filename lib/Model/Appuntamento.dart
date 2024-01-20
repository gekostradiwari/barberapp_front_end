import 'dart:core';
import 'package:barberapp_front_end/Model/Cliente.dart';
import 'package:barberapp_front_end/Model/Dipendente.dart';
import 'package:barberapp_front_end/Model/Titolare.dart';
import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_serializable/json_serializable.dart';

part 'Appuntamento.g.dart';

@JsonSerializable()
class Appuntamento{
  late int id;
  late DateTime data;
  late DateTime ora;
  late Cliente cliente;
  late Dipendente dipendente;
  late Titolare titolare;
  late Servizio servizio;


  Appuntamento(this.id, this.data, this.ora, this.cliente, this.dipendente,
      this.titolare, this.servizio);

  factory Appuntamento.fromJson(Map<String,dynamic> json) => _$AppuntamentoFromJson(json);
  Map<String,dynamic> toJson() => _$AppuntamentoToJson(this);

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

  Cliente get _cliente => cliente;

  set _cliente(Cliente value) {
    cliente = value;
  }

  Dipendente get _dipendente => dipendente;

  set _dipendente(Dipendente value) {
    dipendente = value;
  }

  Titolare get _titolare => titolare;

  set _titolare(Titolare value) {
    titolare = value;
  }

  Servizio get _servizio => servizio;

  set _servizio(Servizio value) {
    servizio = value;
  }

  @override
  String toString() {
    return 'Appuntamento{id: $id, data: $data, ora: $ora, cliente: $cliente, dipendente: $dipendente, titolare: $titolare, servizio: $servizio}';
  }
}