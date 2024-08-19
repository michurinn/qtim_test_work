

import 'package:dio/dio.dart';
import 'package:simple_skeleton/app/config/app_config.dart';
import 'package:simple_skeleton/app/config/environment/environment.dart';

/// {@template app_scope.class}
/// Scope of dependencies which are needed through the whole app's life.
/// {@endtemplate}
final class AppScope implements IAppScope {
  @override
  final Environment env;
  @override
  final AppConfig appConfig;
  @override
  final Dio dio;



  /// {@macro app_scope.class}
  const AppScope({
    required this.env,
    required this.appConfig,
    required this.dio,
  });
}

/// {@macro app_scope.class}
abstract interface class IAppScope {
  /// Environment.
  Environment get env;

  /// App configuration.
  AppConfig get appConfig;

  /// Http client.
  Dio get dio;

}
