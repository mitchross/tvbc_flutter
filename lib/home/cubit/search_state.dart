part of 'search_cubit.dart';

enum SearchStatus { loading, success, failure }

class SearchState extends Equatable {
  const SearchState._({
    this.status = SearchStatus.loading,
    this.searchResults,
    this.searchTerm,
  });

  const SearchState.loading({required String searchTerm})
      : this._(searchTerm: searchTerm);

  const SearchState.success({
    required String searchTerm,
    required List<SearchResult> searchResults,
  }) : this._(
            searchTerm: searchTerm,
            status: SearchStatus.success,
            searchResults: searchResults);

  const SearchState.failure() : this._(status: SearchStatus.failure);

  @override
  List<Object?> get props => [status, searchResults, searchTerm];

  final SearchStatus status;
  // final TvSearchResults tvSearchResults;
  final List<SearchResult>? searchResults;
  final String? searchTerm;
}
