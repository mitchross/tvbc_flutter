import 'dart:io';

import 'package:tvbc_repository/src/tvbc_repository.dart';

void main() async {
  final tvbcRepository = TvbcRepository();

  try {
    final searchResults = await tvbcRepository.searchTVShows("lost");
    for (final show in searchResults.results) {
      print(show.name);
    }
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
