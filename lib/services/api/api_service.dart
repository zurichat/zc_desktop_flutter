import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/core/network/api_constants.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';

import 'api.dart';

//TODO: Refactor error handling logic and properly intialize DIO and write code for interceptors
@LazySingleton()
class ApiService implements Api {
  final log = getLogger('APIService');

  APIConstants get apiConstants => APIConstants.production();
  Dio get client => Dio(
        BaseOptions(
          baseUrl: apiConstants.baseUri.toString(),
          sendTimeout: apiConstants.sendTimeout,
          receiveTimeout: apiConstants.receiveTimeout,
        ),
      );

  @override
  Future<dynamic> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await client.get(uri.toString(),
          queryParameters: queryParameters, options: Options(headers: headers));

      //log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.data['message']);
      throw Failure(error.response!.data['message']);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  @override
  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await client.post(
        uri.toString(),
        data: body,
      );

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.response!.statusCode);
      log.e(error.response!.data['message']);
      throw Failure(error.response!.data['message']);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  @override
  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    log.i('Making request to $uri');
    try {
      final response = await client.put(
        uri.toString(),
        data: body,
      );

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw Failure(error.message);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }

  @override
  Future<dynamic> delete(Uri uri) async {
    log.i('Making request to $uri');
    try {
      final response = await client.delete(uri.toString());

      log.i('Response from $uri \n${response.data}');
      return response.data;
    } on DioError catch (error) {
      log.e(error.message);
      throw Failure(error.message);
    } catch (error) {
      log.e(error.toString());
      throw Failure(error.toString());
    }
  }
}
