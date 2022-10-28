import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('onRequest ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.response) {
      debugPrint('------------------------');
      debugPrint(err.error);
      debugPrint(err.response?.realUri.toString());
      debugPrint(err.response?.statusCode.toString());
      debugPrint(err.response?.data.toString());
      debugPrint('------------------------');
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('onResponse ${response.statusCode} ${response.realUri}');
    super.onResponse(response, handler);
  }
}
