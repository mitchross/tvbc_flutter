import 'package:themoviedb_api/themoviedb_api.dart';

/// Thrown when an error occurs while performing a search.
class SearchException implements Exception {}

class TvbcRepository {
  TvbcRepository({TmdbApiClient tmdbApiClient})
      : _tmdbApiClient = tmdbApiClient ?? TmdbApiClient();

  final TmdbApiClient _tmdbApiClient;

  Future<TvSearchResults> searchTVShows(String searchTerm) async {
    assert(searchTerm != null && searchTerm.isNotEmpty);
    try {
      final searchResults =
          await _tmdbApiClient.getTvSearchResultByTerm(searchTerm);
      return searchResults;
    } on Exception {
      throw SearchException();
    }
  }
}
