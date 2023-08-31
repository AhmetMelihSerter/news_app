// ignore_for_file: always_use_package_imports

import '../../../core/init/network/i_network_manager.dart';

abstract class BaseService {
  BaseService(this.manager);
  final INetworkManager manager;

  final duration = const Duration(seconds: 1);
}
