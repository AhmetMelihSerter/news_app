import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/base/model/auth_model.dart';
import '../../../core/init/storage/i_storage_manager.dart';
import '../../../feature/_model/articles_model.dart';

class SharedPrefManager extends IStorageManager {
  static SharedPrefManager? _instance;

  static SharedPrefManager get instance => _instance ??= SharedPrefManager._internal();

  SharedPrefManager._internal();

  late final SharedPreferences _prefs;

  @override
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void signIn(AuthModel model) => _prefs.setString('token', model.token);

  void addFavorites(ArticlesModel model) {
    final list = getAllFavorites();
    list.add(model);
    _setFavorites(list);
  }

  void _setFavorites(List<ArticlesModel> list) {
    _prefs.setString(
      'favorites',
      jsonEncode(list.map<Map<String, dynamic>>((e) => e.toJson()).toList()),
    );
  }

  void deleteFavorites(ArticlesModel model) {
    final list = getAllFavorites();
    list.removeWhere((e) => e.url == model.url);
    _setFavorites(list);
  }

  List<ArticlesModel> getAllFavorites() {
    final value = _prefs.getString('favorites');
    if (value == null) {
      return [];
    }
    return (jsonDecode(value) as List<dynamic>)
        .map((e) => ArticlesModel.fromJson(e))
        .toList();
  }

  @override
  void signOut() => _prefs.clear();

  @override
  String get token => _prefs.getString('token') ?? '';
}
