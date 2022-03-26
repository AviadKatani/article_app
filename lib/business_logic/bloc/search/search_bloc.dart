import 'package:articles_app/business_logic/bloc/search/search_state.dart';
import 'package:articles_app/business_logic/bloc/search/search_event.dart';
import 'package:articles_app/data/models/response.dart';
import 'package:articles_app/data/repositories/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc(this.searchRepository) : super(InitialSearchState()) {
    on<LoadSearchResults>(_onLoadSearchResults);
    on<ClearSearchResults>(_onClearSearchResults);
  }

  Future<void> _onLoadSearchResults(
      LoadSearchResults event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    try {
      var streamData = searchRepository.getSearchResults();
      emit(SearchLoadedState(streamData));
    } catch (err) {
      emit(SearchErrorState(err.toString()));
    }
  }

  Future<void> _onClearSearchResults(
      ClearSearchResults event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    try {
      searchRepository.clearSearchResults();
      emit(ClearedSearchState());
    } catch (err) {
      emit(SearchErrorState(err.toString()));
    }
  }
}
