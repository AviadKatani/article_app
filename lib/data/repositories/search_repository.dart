import 'dart:io';

import 'package:articles_app/data/dataproviders/local/database.dart';
import 'package:articles_app/data/dataproviders/remote/api_config.dart';
import 'package:articles_app/data/dataproviders/remote/api_service.dart';
import 'package:articles_app/data/dataproviders/remote/dio_config.dart';
import 'package:articles_app/data/models/response.dart';
import 'package:rxdart/rxdart.dart';

class SearchRepository {
  late ApiService _searchService;
  late AppDatabase _appDatabase;

  SearchRepository() {
    _searchService = ApiService(DioConfig.configureDio());
    _appDatabase = AppDatabase();
  }

  Stream<List<Article>> getSearchResults() {
    try {
      Stream<BaseResponse> mergedStream = Rx.merge([
        _searchService.getSearchResults(ApiConfig.apiKey, 'tesla').asStream(),
        _searchService.getSearchResults(ApiConfig.apiKey, 'money').asStream()
      ]).asBroadcastStream();

      mergedStream.listen(
        (event) {
          for (var element in event.articles) {
            _appDatabase.insertArticle(
              Article(
                title: element.title,
                author: element.author ?? "",
                description: element.description,
                urlImage: element.urlToImage,
              ),
            );
          }
        },
      );

      return _appDatabase.watchAllArticles();
    } on Exception catch (err) {
      return _appDatabase.watchAllArticles();
    }
  }

  void clearSearchResults() async {
    try {
      await _appDatabase.deleteAllArticles();
    } on Exception catch (err) {
      print("Failed to clear the DB. $err");
    }
  }
}
