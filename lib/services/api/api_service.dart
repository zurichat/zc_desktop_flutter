import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/core/exceptions/http_exception.dart';
import 'api.dart';

@LazySingleton()
class ApiService implements Api {
  final log = getLogger('PiService');
  Response? _response;
  var responseData;
  final client = Dio();
  static const _BASE_URL = "https://api.zuri.chat";
  static const _sendTimeOut = 5000;

  @override
  Future get(String endPoint, {Map<String, dynamic>? queryParameters}) async {
    var url = _BASE_URL + endPoint;
    try {
      _response = await client.get(url,
          options: Options(sendTimeout: _sendTimeOut, receiveTimeout: 3000));
      log.i(url);
      responseData = _response!.data;
      log.i(responseData);
    } on DioError catch (error) {
      log.i(error);
      throw HttpException(error.message);
    } catch (error) {
      log.i(error);
      throw error;
    }

    return responseData;
  }

  @override
  Future post(String endPoint, Map<String, dynamic>? body,
      {Map<String, dynamic>? headers}) async {
    var url = _BASE_URL + endPoint;
    try {
      _response = await client.post(url,
          data: body, options: Options(sendTimeout: _sendTimeOut));
      log.i(url);
      log.i(_response!.statusCode);
      responseData = _response!.data;
      log.i(responseData);
    } on DioError catch (error) {
      log.i(error);
      throw HttpException(error.message);
    } catch (error) {
      log.i(error);
      throw error;
    }
    return responseData;
  }

  @override
  Future<Response> put(String endPoint, data,
      {Map<String, dynamic>? queryParameters}) async {
    var url = _BASE_URL + endPoint;
    try {
      _response = await client.put(url,
          data: data, options: Options(sendTimeout: _sendTimeOut));
      log.i(url);
      responseData = _response!.data;
    } on DioError catch (error) {
      log.i(error);
    } catch (error) {
      log.i(error);
    }
    return responseData;
  }

  @override
  Future delete(String endPoint,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var url = _BASE_URL + endPoint;
    try {
      _response =
          await client.delete(url, options: Options(sendTimeout: _sendTimeOut));
      log.i(url);
      responseData = _response!.data;
    } on DioError catch (error) {
      //write code for interceptors
      log.i(error);
    } catch (error) {
      log.i(error);
    }
  }
}
