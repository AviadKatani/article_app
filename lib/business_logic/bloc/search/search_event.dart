abstract class SearchEvent {
  const SearchEvent();
}

class LoadSearchResults extends SearchEvent {
  const LoadSearchResults();
}

class ClearSearchResults extends SearchEvent {
  const ClearSearchResults();
}
