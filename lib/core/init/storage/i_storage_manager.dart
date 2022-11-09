import '../../base/model/auth_model.dart';

abstract class IStorageManager {
  Future<void> initialize();

  String get token;

  void signIn(AuthModel model);
  void signOut();

  
}
