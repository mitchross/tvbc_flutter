part of 'showdetails_cubit.dart';

abstract class ShowdetailsState extends Equatable {
  const ShowdetailsState();

  @override
  List<Object> get props => [];
}

class ShowdetailsInitialState extends ShowdetailsState {}

class ShowdetailsErrorState extends ShowdetailsState {}

class ShowdetailsLoaded extends ShowdetailsState {
  final TvShowDetails showdetails;

  ShowdetailsLoaded({required this.showdetails});

   @override
  List<Object> get props => [showdetails];

}



