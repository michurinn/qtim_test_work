import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_skeleton/app/config/environment/build_type.dart';
import 'package:simple_skeleton/app/config/environment/environment.dart';
import 'package:simple_skeleton/app/di/app_scope_register.dart';
import 'package:simple_skeleton/src/app_flow.dart';

void main() async {
  const env = Environment(
    buildType: BuildType.dev,
  );
  const scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope(env);

  runApp(ProviderScope(
    child: AppFlow(
      appScope: scope,
    ),
  ));
}
