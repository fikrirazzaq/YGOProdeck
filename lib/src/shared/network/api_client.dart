import 'package:dio/dio.dart';

import '../shared.dart';

const connectionTimeout = 60000;
const connectionReadTimeout = 30000;
const connectionWriteTimeOut = 30000;

class ApiClient {
  Dio _dio;

  ApiClient() {
    _dio = Dio();

    _dio.options.baseUrl = "";

    _dio.options.connectTimeout = connectionTimeout;
    _dio.options.receiveTimeout = connectionReadTimeout;
    _dio.options.followRedirects = false;
    _dio.options.validateStatus = ((statusCode) => statusCode < 500);

    var loggingInterceptor = getLoggingInterceptor();
    var errorInterceptor = getErrorInterceptor(loggingInterceptor);
    var responseInterceptor = getResponseInterceptor(loggingInterceptor);
    var requestInterceptor = getRequestInterceptor(loggingInterceptor);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async =>
            await requestInterceptor.getRequestInterceptor(options),
        onResponse: (Response response) =>
            responseInterceptor.getResponseInterceptor(response),
        onError: (DioError dioError) =>
            errorInterceptor.getErrorInterceptors(dioError),
      ),
    );
  }

  Future<dynamic> getRequest(String url) async {
    final response = await _dio.get(
      "$url",
      options: Options(headers: {
        '${Headers.contentTypeHeader}': 'application/json',
      }),
    );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> putRequest(String url, dynamic body) async {
    final response = await _dio.put("$url",
        options: Options(headers: {
          '${Headers.contentTypeHeader}': 'application/json',
        }),
        data: body);

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> patchRequest(String url, dynamic body) async {
    final response = await _dio.patch("$url",
        options: Options(headers: {
          '${Headers.contentTypeHeader}': 'application/json',
        }),
        data: body);

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> postRequest(String url, dynamic body) async {
    final response = await _dio.post("$url",
        options: Options(headers: {
          '${Headers.contentTypeHeader}': 'application/json',
        }),
        data: body);

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }
}
