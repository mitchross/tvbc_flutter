import 'dart:io';

import 'package:dio/dio.dart';

import 'models/models.dart';

class TmdbApiClient {
  static String base = "https://api.themoviedb.org/3";
  final String API_KEY = "";

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
}
