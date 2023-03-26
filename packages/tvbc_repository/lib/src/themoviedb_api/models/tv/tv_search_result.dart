// To parse this JSON data, do
//
//     final tvSearchResultsDart = tvSearchResultsDartFromJson(jsonString);
//https://app.quicktype.io/
import 'dart:convert';

import '../models.dart';

TvSearchResults tvSearchResultsFromJson(String str) =>
    TvSearchResults.fromJson(json.decode(str));

class TvSearchResults {
  TvSearchResults({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory TvSearchResults.fromJson(Map<String, dynamic> json) =>
      TvSearchResults(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );
}

class Result {
  Result({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  OriginalLanguage? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : originalLanguageValues.map[json["original_language"]],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );
}

// enum OriginalLanguage { EN, JA }

// final originalLanguageValues = EnumValues({
//     "en": OriginalLanguage.EN,
//     "ja": OriginalLanguage.JA
// });

// class EnumValues<T> {
//     Map<String, T>? map;
//     Map<T, String>? reverseMap;

//     EnumValues(this.map);

//     Map<T, String>? get reverse {
//         if (reverseMap == null) {
//             reverseMap = map?.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }


