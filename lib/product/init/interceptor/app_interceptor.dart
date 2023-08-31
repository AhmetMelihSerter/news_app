import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/core/init/logger/i_logger_manager.dart';
import 'package:news_app/core/init/navigation/i_navigation_service.dart';
import 'package:news_app/core/init/storage/i_storage_manager.dart';

@Singleton(as: Interceptor)
class AppInterceptor extends Interceptor {
  AppInterceptor(
    this._loggerManager,
    this._storageManager,
    this._navigationService,
  );

  final ILoggerManager _loggerManager;
  final IStorageManager _storageManager;
  final INavigationService _navigationService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = 'Dio Url: ${options.uri}\n';
    final method = 'Dio Method: ${options.method}\n';
    final header = 'Dio Header: ${options.headers}\n';
    final queryParams = 'Dio Query Params: ${options.queryParameters}\n';
    final request = 'Dio Request: ${options.data}';
    final fullLog = url + method + header + queryParams + request;
    _loggerManager.debug(fullLog);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final header = 'Dio Headers: ${response.headers}\n';
    final statusCode = 'Dio Status Code: ${response.statusCode}\n';
    final dioResponse = 'Dio Response: ${response.data}';
    final fullLog = header + statusCode + dioResponse;
    _loggerManager.debug(fullLog);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    if (statusCode == HttpStatus.forbidden ||
        statusCode == HttpStatus.unauthorized) {
      //_unAuthorized();
    }
    _loggerManager.debug('Error Status Code: ${err.response?.statusCode}');
    super.onError(err, handler);
  }

  void _unAuthorized() {
    _navigationService.unAuthorized();
    _storageManager.deleteUser();
  }
}
