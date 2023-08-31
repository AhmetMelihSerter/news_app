// ignore_for_file: always_use_package_imports

import '../../base/model/base_model.dart';
import '../../constants/enums/app_enum.dart';

typedef DownloadProgressCallback = void Function(int count, int total);

abstract class INetworkManager {
  void addBaseHeader(MapEntry<String, String> mapEntry);
  void clearHeader();
  Future<T?> send<T extends BaseModel<T>>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    RequestType requestType = RequestType.GET,
    required T parseModel,
  });

  Future<List<int>?> downloadFileSimple(
    String path, {
    DownloadProgressCallback? onReceiveProgress,
  });
}
