import 'package:articles_app/data/dataproviders/local/database.dart';
import 'package:articles_app/data/models/response.dart';

abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final Stream<List<Article>> response;

  const SearchLoadedState(this.response);
}

class SearchErrorState extends SearchState {
  final String errMessage;

  const SearchErrorState(this.errMessage);
}

class ClearedSearchState extends SearchState {}
