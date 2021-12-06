import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvbc_flutter/details/cubit/showdetails_cubit.dart';
import 'package:tvbc_flutter/home/cubit/search_cubit.dart';

class DetailsView extends StatelessWidget {
  final String imageBaseUrl = "https://image.tmdb.org/t/p/w500/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: BlocBuilder<ShowdetailsCubit, ShowdetailsState>(
          builder: (context, state) {
           if( state is ShowdetailsLoaded)
             
              return Column(
                children: [
                  Text(state.showdetails.genres[0].name),
                  Text(state.showdetails.name ),
                  Text(state.showdetails.firstAirDate),
                  Text("rating: " + state.showdetails.voteAverage.toString() + " votes: " + state.showdetails.voteCount.toString()),
                  Image.network((imageBaseUrl + state.showdetails.posterPath)),
                
                ],
              );
            else
              return Text('Loading');
          },
        ),
      ),
    );
  }
}
