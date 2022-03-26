import 'package:articles_app/data/models/articles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "totalResults")
  final int totalResults;

  @JsonKey(name: "articles")
  final List<ArticleModel> articles;

  const BaseResponse(this.status, this.totalResults, {this.articles = const []});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  String toString() {
    return 'BaseResponse{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}