import 'package:simple_skeleton/app/domain/request_operation.dart';
import 'package:simple_skeleton/src/news_feature/domain/models/news_model.dart';

/// Data source for fetching 
abstract interface class DataSource {
  ///
  RequestOperation<List<NewsModel>> fetchNews();
} 