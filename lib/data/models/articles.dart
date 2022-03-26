import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: "author")
  final String? author;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "urlToImage")
  final String urlToImage;

  const ArticleModel(
      this.author, this.title, this.description, this.urlToImage);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  @override
  String toString() {
    return 'ArticleModel{author: $author, title: $title, description: $description, urlToImage: $urlToImage}';
  }
}
