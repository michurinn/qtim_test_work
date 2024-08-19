import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_skeleton/app/di/app_scope.dart';
import 'package:simple_skeleton/common/disposable_object/disposable_object.dart';
import 'package:simple_skeleton/common/disposable_object/i_disposable_object.dart';
import 'package:simple_skeleton/src/news_feature/data/data_source/i_data_source.dart';
import 'package:simple_skeleton/src/news_feature/data/data_source/remote_data_source.dart';

final class NewsScope extends DisposableObject implements IModeScope {
  @override
  DataSource dataSource;
  factory NewsScope.create(BuildContext context) {
    return NewsScope(
      dataSource: RemoteDataSource(
        dio: context.read<IAppScope>().dio,
      ),
    );
  }

  NewsScope({required this.dataSource});
}

abstract interface class IModeScope implements IDisposableObject {
  DataSource get dataSource;
}
