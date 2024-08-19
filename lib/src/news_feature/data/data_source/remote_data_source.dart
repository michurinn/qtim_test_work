import 'package:dio/dio.dart';
import 'package:simple_skeleton/app/domain/failure.dart';
import 'package:simple_skeleton/app/domain/request_operation.dart';
import 'package:simple_skeleton/app/domain/result.dart';
import 'package:simple_skeleton/src/news_feature/data/data_source/i_data_source.dart';
import 'package:simple_skeleton/src/news_feature/domain/models/news_model.dart';

final class RemoteDataSource implements DataSource {
  final Dio dio;

  RemoteDataSource({required this.dio});

  @override
  RequestOperation<List<NewsModel>> fetchNews() async {
    try {
      final responce = await dio.get('/posts');
      if (responce.statusCode == 200) {
        return Result.ok(
          (responce.data as List)
              .map(
                (element) => NewsModel.fromJson(element),
              )
              .toList(),
        );
      } else {
        return const Result.failed(
          Failure(
            original: 'Status code is not 200',
            trace: null,
          ),
        );
      }
    } catch (e, st) {
      return ResultFailed(Failure(original: e, trace: st));
    }
  }
}
