import 'package:dio/dio.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'api.dart';


class FakeAPiService implements Api {
  final log = getLogger('FakeAPiService');
  Response? _response;
  var responseData;
  final client = Dio();
  static const _BASE_URL = "";
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
    } catch (error) {
      log.i(error);
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
    } on DioError catch (error) {
      //write code for interceptors
      log.i(error);
    } catch (error) {
      log.i(error);
    }
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
      {dynamic  data, Map<String, dynamic>? queryParameters}) async {
    var url = _BASE_URL + endPoint;
    try {
      _response = await client.delete(url, options: Options(sendTimeout: _sendTimeOut));
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
