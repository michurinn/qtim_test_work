import 'package:flutter/material.dart';
import 'package:simple_skeleton/common/widgets/di_scope.dart';
import 'package:simple_skeleton/src/news_feature/di/news_scope.dart';
import 'package:simple_skeleton/src/news_feature/presentation/news_page.dart';

class NewsFlow extends StatelessWidget {
  const NewsFlow({super.key});
  static const routeName = '/news';
  @override
  Widget build(BuildContext context) {
    return DiScope<NewsScope>(
      factory: (context) => NewsScope.create(context),
      child: const NewsPage(),
    );
  }
}
