import 'package:dio/dio.dart';


abstract class Api {
  Future<dynamic> post(String endPoint, Map<String, dynamic>? body,
      {Map<String, dynamic>? headers});
  Future<dynamic> get(String endPoint, {Map<String, dynamic>? queryParameters});
  Future<Response<dynamic>> put(String endPoint, dynamic data,
      {Map<String, dynamic>? queryParameters});
  Future<dynamic> delete(String endPoint,
      {dynamic data, Map<String, dynamic>? queryParameters});
}
