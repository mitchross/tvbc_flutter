import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tvbc_repository/tvbc_repository.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._tvbcRepository) : super(SearchInitial());

  final TvbcRepository _tvbcRepository;

  Future<void> getTVSearchResults({String searchTerm}) async {
    
  }
}
