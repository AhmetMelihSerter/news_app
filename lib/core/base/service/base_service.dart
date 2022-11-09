import '../../../product/init/network/vexana_manager.dart';

abstract class BaseService {
  final NetworkBase manager;

  final duration = const Duration(seconds: 1);

  BaseService(this.manager);
}
