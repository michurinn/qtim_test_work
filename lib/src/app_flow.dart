
import 'package:flutter/material.dart';
import 'package:simple_skeleton/app/di/app_scope.dart';
import 'package:simple_skeleton/common/widgets/di_scope.dart';
import 'package:simple_skeleton/src/app.dart';

class AppFlow extends StatelessWidget {
  const AppFlow({
    required this.appScope,
    super.key,
  });

  final IAppScope appScope;

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      factory: (context) => appScope,
      child: const MyApp(),
    );
  }
}
