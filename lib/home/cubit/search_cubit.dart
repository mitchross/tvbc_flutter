import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tvbc_flutter/home/models/search_result.dart';
import 'package:tvbc_repository/tvbc_repository.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._tvbcRepository) : super(const SearchState.loading(searchTerm: "lost"));

  final TvbcRepository _tvbcRepository;

  Future<void> getTVSearchResults({required String searchTerm}) async {
    emit(SearchState.loading(searchTerm: searchTerm));
    try {
      //todo clean up
      final apiResults = await _tvbcRepository.searchTVShows(searchTerm);
      final searchResults = apiResults.results!
          .map((e) => SearchResult(e.posterPath, e.name, e.voteAverage, e.id.toString()))
          .toList();
      emit(SearchState.success(
          searchTerm: searchTerm, searchResults: searchResults));
    } on Exception {
      emit(const SearchState.failure());
    }
  }
}
