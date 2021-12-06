
import 'package:tvbc_repository/src/themoviedb_api/models/models.dart';
import 'package:tvbc_repository/src/themoviedb_api/tmdb_apt_client.dart';



/// Thrown when an error occurs while performing a search.
class SearchException implements Exception {}

class TvbcRepository {
  TvbcRepository()
      : _tmdbApiClient =  TmdbApiClient();

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

    Future<MovieSearchResults> searchMovies(String searchTerm) async {
    assert(searchTerm != null && searchTerm.isNotEmpty);
    try {
      final searchResults =
          await _tmdbApiClient.getMovieSearchResultByTerm(searchTerm);
      return searchResults;
    } on Exception {
      throw SearchException();
    }
  }


    Future<TvShowDetails?> getShowById(String id) async {
    assert(id != null && id.isNotEmpty);
    try {
      final searchResults =
          await _tmdbApiClient.getTvShowById(id);
      return searchResults;
    } on Exception {
      throw SearchException();
    }
  }

      Future<MovieDetails> getMovieById(String id) async {
    assert(id != null && id.isNotEmpty);
    try {
      final searchResults =
          await _tmdbApiClient.getMovieById(id);
      return searchResults;
    } on Exception {
      throw SearchException();
    }
  }
}
