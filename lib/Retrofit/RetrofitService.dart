import 'dart:core';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:barberapp_front_end/Model/Cliente.dart';
part 'RetrofitService.g.dart';

@RestApi(baseUrl: "URL")
abstract class RetrofitService {
  factory RetrofitService(Dio dio) = _RetrofitService;

  @GET('clienti')
  Future<List<Cliente>> getPosts();
}
