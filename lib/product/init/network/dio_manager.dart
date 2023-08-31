// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/core/base/model/base_model.dart';
import 'package:news_app/core/constants/enums/app_enum.dart';
import 'package:news_app/core/init/network/i_network_manager.dart';
import 'package:news_app/product/constants/product/product_constants.dart';

@Singleton(as: INetworkManager)
class DioManager extends INetworkManager {
  DioManager(Interceptor interceptor) {
    _interceptor = interceptor;
    _dio.interceptors.add(interceptor);
  }

  late final Interceptor _interceptor;

  final _dio = Dio(
    BaseOptions(
      baseUrl: ProductConstants.BASE_URL,
    ),
  );

  @override
  void addBaseHeader(MapEntry<String, String> mapEntry) {
    _dio.options.headers[mapEntry.key] = mapEntry.value;
  }

  @override
  void clearHeader() {
    _dio.options.headers.clear();
  }

  @override
  Future<List<int>?> downloadFileSimple(
    String path, {
    DownloadProgressCallback? onReceiveProgress,
  }) async {
    final newDio = Dio()..interceptors.add(_interceptor);
    final response = await newDio.get<List<int>>(
      path,
      options: Options(
        followRedirects: false,
        responseType: ResponseType.bytes,
      ),
      onReceiveProgress: onReceiveProgress,
    );

    return response.data;
  }

  @override
  Future<T?> send<T extends BaseModel<T>>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    RequestType requestType = RequestType.GET,
    required T parseModel,
  }) async {
    Response<dynamic> response;
    final bodyModel = _getBodyModel(data);
    final options = bodyModel is FormData
        ? Options(
            contentType: 'multipart/form-data',
          )
        : null;
    if (requestType == RequestType.GET) {
      response = await _requestGet(path, queryParameters);
    } else if (requestType == RequestType.POST) {
      response = await _requestPost(
        path,
        queryParameters,
        bodyModel,
        options: options,
      );
    } else if (requestType == RequestType.PUT) {
      response = await _requestPut(
        path,
        queryParameters,
        bodyModel,
        options: options,
      );
    } else if (requestType == RequestType.PATCH) {
      response = await _requestPatch(
        path,
        queryParameters,
        bodyModel,
        options: options,
      );
    } else {
      response = await _requestDelete(
        path,
        queryParameters,
        bodyModel,
        options: options,
      );
    }
    if (response.data is Map<String, dynamic>) {
      return parseModel.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }

  dynamic _getBodyModel(dynamic data) {
    if (data is BaseModel) {
      return data.toJson();
    } else if (data is FormData) {
    } else if (data != null) {
      return jsonEncode(data);
    }
    return data;
  }

  Future<Response<dynamic>> _requestGet(
    String path,
    Map<String, dynamic>? queryParameters,
  ) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestPost(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data, {
    Options? options,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestPut(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data, {
    Options? options,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestPatch(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data, {
    Options? options,
  }) async {
    final response = await _dio.patch(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestDelete(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data, {
    Options? options,
  }) async {
    final response = await _dio.delete(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }
}
