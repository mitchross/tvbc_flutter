import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tvbc_repository/tvbc_repository.dart';

part 'showdetails_state.dart';

class ShowdetailsCubit extends Cubit<ShowdetailsState> {
  ShowdetailsCubit(this._tvbcRepository) : super(ShowdetailsInitialState());

  final TvbcRepository _tvbcRepository;

  Future<void> getTvShowById({required String id}) async {
    emit(ShowdetailsInitialState());
    try {
      //todo clean up
      final apiResults = await _tvbcRepository.getShowById(id);
      emit(ShowdetailsLoaded(showdetails: apiResults!));
    } on Exception {
      emit(ShowdetailsErrorState());
    }
  }
}
