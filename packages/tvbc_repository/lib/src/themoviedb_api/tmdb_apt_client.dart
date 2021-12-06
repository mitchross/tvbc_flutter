import 'package:dio/dio.dart';

import 'models/models.dart';

class TmdbApiClient {
  static String base = "https://api.themoviedb.org/3";
  final String API_KEY = "c94d67d2be21c404bce0cc3d7abd182d";

  Dio dio = Dio(BaseOptions(baseUrl: base));

  Future<TvSearchResults> getTvSearchResultByTerm(String searchTerm) async {
    try {
      Response response = await dio.get(base + '/search/tv', queryParameters: {
        "api_key": API_KEY,
        "language": "en-US",
        "page": 1,
        "query": searchTerm,
        "include_adult": false
      });
      return TvSearchResults.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //empty state?
      return TvSearchResults();
    }
  }

  Future<MovieSearchResults> getMovieSearchResultByTerm(
      String searchTerm) async {
    try {
      Response response =
          await dio.get(base + '/search/movie', queryParameters: {
        "api_key": API_KEY,
        "language": "en-US",
        "page": 1,
        "query": searchTerm,
        "include_adult": false
      });
      return MovieSearchResults.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //empty state?
      return MovieSearchResults();
    }
  }

  Future<TvShowDetails?> getTvShowById(String id) async {
    try {
      Response response = await dio.get(base + '/tv/' + id, queryParameters: {
        "api_key": API_KEY,
        "language": "en-US",
      });
      return TvShowDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //empty state?
      return null;
    }
  }

  Future<MovieDetails> getMovieById(String id) async {
    try {
      Response response =
          await dio.get(base + '/movie/' + id, queryParameters: {
        "api_key": API_KEY,
        "language": "en-US",
      });
      return MovieDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //empty state?
      return MovieDetails();
    }
  }
}
