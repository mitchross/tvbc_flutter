import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  const SearchResult(this.imageLink, this.title, this.score,this.id);
  final String? imageLink;
  final String? title;
  final double? score;
  final String? id;

  @override
  // TODO: implement props
  List<Object?> get props => [imageLink, title, score,id];
}
