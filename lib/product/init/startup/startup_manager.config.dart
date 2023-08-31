// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/core/init/logger/i_logger_manager.dart' as _i3;
import 'package:news_app/core/init/navigation/i_navigation_service.dart' as _i5;
import 'package:news_app/core/init/network/i_network_manager.dart' as _i18;
import 'package:news_app/core/init/secure/i_secure_manager.dart' as _i7;
import 'package:news_app/core/init/storage/i_storage_manager.dart' as _i9;
import 'package:news_app/core/init/theme/i_theme_manager.dart' as _i11;
import 'package:news_app/feature/dashboard/favorites/service/favorites_service.dart'
    as _i24;
import 'package:news_app/feature/dashboard/favorites/service/i_favorites_service.dart'
    as _i23;
import 'package:news_app/feature/dashboard/favorites/view_model/favorites_view_model.dart'
    as _i26;
import 'package:news_app/feature/dashboard/news/_news/service/i_news_service.dart'
    as _i20;
import 'package:news_app/feature/dashboard/news/_news/service/news_service.dart'
    as _i21;
import 'package:news_app/feature/dashboard/news/_news/view_model/news_view_model.dart'
    as _i22;
import 'package:news_app/feature/dashboard/news/news_detail/view_model/news_detail_view_model.dart'
    as _i25;
import 'package:news_app/feature/dashboard/news/news_source/view_model/news_source_view_model.dart'
    as _i16;
import 'package:news_app/feature/splash/view_model/splash_view_model.dart'
    as _i17;
import 'package:news_app/product/init/interceptor/app_interceptor.dart' as _i14;
import 'package:news_app/product/init/language/language_manager.dart' as _i15;
import 'package:news_app/product/init/logger/logger_manager.dart' as _i4;
import 'package:news_app/product/init/navigation/navigation_service.dart'
    as _i6;
import 'package:news_app/product/init/network/dio_manager.dart' as _i19;
import 'package:news_app/product/init/secure/secure_storage_manager.dart'
    as _i8;
import 'package:news_app/product/init/storage/hive_manager.dart' as _i10;
import 'package:news_app/product/init/theme/theme_manager.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ILoggerManager>(_i4.LoggerManager());
    gh.singleton<_i5.INavigationService>(_i6.AutoRouterManager());
    gh.singleton<_i7.ISecureManager>(
        _i8.SecureStorageManager(gh<_i3.ILoggerManager>()));
    gh.singleton<_i9.IStorageManager>(
        _i10.HiveManager(gh<_i7.ISecureManager>()));
    gh.singleton<_i11.IThemeManager>(_i12.ThemeManager());
    gh.singleton<_i13.Interceptor>(_i14.AppInterceptor(
      gh<_i3.ILoggerManager>(),
      gh<_i9.IStorageManager>(),
      gh<_i5.INavigationService>(),
    ));
    gh.singleton<_i15.LanguageManager>(_i15.LanguageManager());
    gh.factory<_i16.NewsSourceViewModel>(() => _i16.NewsSourceViewModel());
    gh.factory<_i17.SplashViewModel>(() => _i17.SplashViewModel());
    gh.singleton<_i18.INetworkManager>(_i19.DioManager(gh<_i13.Interceptor>()));
    gh.factory<_i20.INewsService>(
        () => _i21.NewsService(gh<_i18.INetworkManager>()));
    gh.factory<_i22.NewsViewModel>(
        () => _i22.NewsViewModel(gh<_i20.INewsService>()));
    gh.factory<_i23.IFavoritesService>(() => _i24.FavoritesService(
          gh<_i18.INetworkManager>(),
          gh<_i9.IStorageManager>(),
        ));
    gh.factory<_i25.NewsDetailViewModel>(
        () => _i25.NewsDetailViewModel(gh<_i23.IFavoritesService>()));
    gh.factory<_i26.FavoritesViewModel>(
        () => _i26.FavoritesViewModel(gh<_i23.IFavoritesService>()));
    return this;
  }
}
