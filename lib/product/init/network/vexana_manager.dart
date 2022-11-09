import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:vexana/vexana.dart';

import '../../../core/base/model/auth_model.dart';
import '../../../core/constants/app/application_constants.dart';
import '../../../core/init/navigation/i_navigation_service.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../logger/logger_manager.dart';
import '../navigation/navigation_service.dart';

abstract class NetworkBase extends NetworkManager {
  NetworkBase({required super.options, required super.isEnableLogger});
}

class VexanaManager extends NetworkBase {
  static VexanaManager? _instance;

  static VexanaManager get instance => _instance ??= VexanaManager._internal();

  VexanaManager._internal()
      : super(
          options: BaseOptions(
            baseUrl: ApplicationConstants.baseUrl,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          isEnableLogger: !kReleaseMode,
        ) {
    _addInterceptors();
  }

  String get _tokenRoute => 'token';

  void _addInterceptors() {
    final logger = LoggerManager.instance;
    final navigationService = NavigationService.instance;
    //final storageManager = SharedPrefManager.instance;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          _onRequestHandler(
            //storageManager,
            request,
          );
          logger.verbose(
              'Dio Url: ${request.baseUrl}${request.path}\nDio Method: ${request.method}\nDio Header: ${request.headers}\nDio Request: ${request.data}');
          handler.next(request);
        },
        onResponse: (response, handler) {
          logger.verbose(
              'Dio Response: $response\nDio Headers: ${response.headers}\nDio Status Code: ${response.statusCode}\nDio Data: ${response.data}');
          _onResponseHandler(
            //storageManager,
            response.requestOptions.path,
            response.statusCode,
            response.requestOptions.data,
            response.data,
          );
          handler.next(response);
        },
        onError: (error, handler) {
          logger.verbose('Error Status Code: ${error.response?.statusCode}');
          _onErrorHandler(
            //storageManager,
            navigationService,
            error.response?.statusCode,
          );
          handler.next(error);
        },
      ),
    );
  }

  void _onRequestHandler(
    //IStorageManager storageManager,
    RequestOptions request,
  ) {
    if (request.path == _tokenRoute) {
      super.removeHeader(HttpHeaders.authorizationHeader);
    } /*else if (storageManager.token.isNotEmpty) {
      final mapEntry = MapEntry(
        HttpHeaders.authorizationHeader,
        'Bearer ${storageManager.token}',
      );
      request.headers[mapEntry.key] = mapEntry.value;
    }*/
  }

  void _onResponseHandler(
    //IStorageManager storageManager,
    String path,
    int? statusCode,
    dynamic reqData,
    dynamic resData,
  ) {
    if (path == _tokenRoute && statusCode == HttpStatus.ok) {
      final fullJson = resData as Map<String, Object?>;
      fullJson.addAll(reqData);
      final authModel = AuthModel.fromJson(fullJson);
      //storageManager.signIn(authModel);
      super.addBaseHeader(
        MapEntry(HttpHeaders.authorizationHeader, 'Bearer ${authModel.token}'),
      );
    }
  }

  void _onErrorHandler(
    //IStorageManager storageManager,
    INavigationService navigationService,
    int? statusCode,
  ) {
    final navigationService = NavigationService.instance;
    if (statusCode == HttpStatus.forbidden || statusCode == HttpStatus.unauthorized) {
      //storageManager.signOut();
      navigationService.navigateToPageClear(
        path: NavigationConstants.splashRoute,
      );
    }
  }
}
