import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_model.g.dart';
part 'news_model.freezed.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _NewsModel;
  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}