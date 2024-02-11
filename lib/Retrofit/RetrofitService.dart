import 'dart:core';
import 'package:barberapp_front_end/Model/Appuntamento.dart';
import 'package:barberapp_front_end/Model/Dipendente.dart';
import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:barberapp_front_end/Model/Cliente.dart';

import '../Model/Titolare.dart';
part 'RetrofitService.g.dart';

@RestApi(baseUrl: "URL/mettere lo slash finale nell'url")
abstract class RetrofitService {
  factory RetrofitService(Dio dio) = _RetrofitService;

  //Qui vanno scritte le API rest che vanno fatte al backend proprio come sono descritte all'interno del backend controller
  @GET('clienti/get-all')
  Future<List<Cliente>> getPosts();

  @POST('cliente/check')
  Future<int> checkEmail(@Body() String email);

  @POST('clienti/save')
  Future<int> saveCliente(@Body() Cliente cliente);

  @POST('clienti/update')
  Future<int> updateCliente(@Body() Cliente cliente);

  @POST('clienti/delete')
  Future<int> deleteCliente(@Body() Cliente cliente);

  @POST('clienti/login')
  Future<Cliente?> clienteLogin(@Body() String email, @Body() String password);

  @POST('titolari/login')
  Future<Titolare?> titolareLogin(@Body() String email, @Body() String password);

  @POST('titolari/delete')
  Future<int> titolareDelete(@Body() Titolare titolare);

  @POST('titolari/check')
  Future<int> checkEmailTitolare(@Body() String email);

  @POST('titolari/update')
  Future<int> updateTitolare(@Body() Titolare titolare);

  @GET('servizi/get-all')
  Future<List<Servizio>> getServices();

  @POST('servizi/save')
  Future<int> saveServizio(@Body() Servizio servizio);

  @POST('servizi/delete')
  Future<int> deleteServizio(@Body() Servizio servizio);

  @POST('servizi/update')
  Future<int> updateServizio(@Body() Servizio servizio);

  @POST('dipendenti/dipendentiDisponibili')
  Future<List<Dipendente>> getFreeEmployee(@Body() DateTime data, @Body() DateTime ora);
  @POST('dipendenti/login')
  Future<Dipendente?> dipendenteLogin(@Body() String email, @Body() String password);

  @GET('dipendenti/get-all')
  Future<List<Dipendente>> dipendentiGetAll();

  @POST('dipendenti/delete')
  Future<int> deleteDipendente(@Body() Dipendente dipendente);

  @POST('appuntamenti/save')
  Future<int> saveAppuntamento(@Body() Appuntamento appuntamento);

  @POST('dipendenti/check')
  Future<int> checkEmailDipendente(@Body() String email);

  @POST('dipendenti/update')
  Future<int> updateDipendente(@Body() Dipendente dipendente);

  @POST('dipendenti/save')
  Future<int> saveDipendente(@Body() Dipendente dipendente);

  @POST('appuntamenti/getAppointment-ByCliente')
  Future<List<Appuntamento>> getAppuntamentiByCliente(@Body() Cliente cliente);

  @POST('appuntamenti/getAppointment-ByDipendente')
  Future<List<Appuntamento>> getAppuntamentiByDipendente(@Body() Dipendente dipendente);

  @POST('appuntamenti/delete')
  Future<int> deleteAppuntamento(@Body() Appuntamento appuntamento);

  @GET('appuntamenti/get-all-appuntamenti')
  Future<List<Appuntamento>> getAllAppuntamentiOrdered();
}
