// ignore_for_file: always_use_package_imports, strict_raw_type

import '../../../core/base/model/base_auth_model.dart';
import '../../../product/model/auth_model.dart';

abstract class IUserSubscription {
  void createUser(BaseAuthModel<AuthModel> model);
  void deleteUser();
}
