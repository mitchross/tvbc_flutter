import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  const SearchResult(this.imageLink, this.title, this.score);
  final String imageLink;
  final String title;
  final double score;

  @override
  // TODO: implement props
  List<Object> get props => [imageLink, title, score];
}
