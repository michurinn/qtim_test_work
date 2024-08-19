import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_skeleton/app/domain/result.dart';
import 'package:simple_skeleton/src/news_feature/di/news_scope.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<NewsScope>().dataSource.fetchNews(),
        builder: (context, snapshot) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            slivers: switch (snapshot.data) {
              ResultOk(data: var data) => (data)
                  .map(
                    (element) => SliverToBoxAdapter(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                element.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(element.body)
                            ],
                          ),
                        ),
                      ),
                    ) as Widget,
                  )
                  .toList(),
              ResultFailed(failure: var fail) => <Widget>[
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        fail.original.toString(),
                      ),
                    ),
                  )
                ],
              _ => <Widget>[
                  SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
            }
              // ..insert(
              //   0,
              //   const SliverAppBar(
              //     pinned: true,
              //     automaticallyImplyLeading: false,
              //     title: Text('Title for news'),
              //   ),
              // )
              // ..insert(
              //   1,
              //   SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //       childCount: 1,
              //       (context, index) {
              //         if (snapshot.hasData && snapshot.data is ResultOk) {
              //           return Card(
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 children: [
              //                   Text(
              //                     ((snapshot.data as ResultOk).data as List)[0]
              //                         .title,
              //                     style: const TextStyle(
              //                         fontWeight: FontWeight.w600),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         } else {
              //           return SliverToBoxAdapter(
              //             child: SizedBox.shrink(),
              //           );
              //         }
              //       },
              //     ),
              //   ),
              // ),
          ),
        ),
      ),
    );
  }
}
