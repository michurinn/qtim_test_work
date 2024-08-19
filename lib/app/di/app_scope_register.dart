

import 'package:flutter/foundation.dart';
import 'package:simple_skeleton/app/config/app_config.dart';
import 'package:simple_skeleton/app/config/app_dio_configurator.dart';
import 'package:simple_skeleton/app/config/environment/environment.dart';
import 'package:simple_skeleton/app/di/app_scope.dart';

/// {@template app_scope_register.class}
/// Creates and initializes AppScope.
/// {@endtemplate}
final class AppScopeRegister {
  /// {@macro app_scope_register.class}
  const AppScopeRegister();

  /// Create scope.
  Future<IAppScope> createScope(Environment env) async {
    final appConfig = _createAppConfig(env);

    const dioConfigurator = AppDioConfigurator();
    final dio = dioConfigurator.create(
      interceptors: [],
      url: appConfig.url.value,
      proxyUrl: appConfig.proxyUrl,
    );

    return AppScope(
      env: env,
      appConfig: appConfig,
      dio: dio,
    );
  }

  AppConfig _createAppConfig(Environment env) {
    if (env.isProd && kReleaseMode) {
      return AppConfig(url: env.buildType.defaultUrl);
    }

    return AppConfig(url: env.buildType.defaultUrl);
  }
}
