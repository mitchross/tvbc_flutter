import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvbc_flutter/details/cubit/showdetails_cubit.dart';

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
            if (state is ShowdetailsLoaded)
              return Column(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Column contents horizontally,
                  children: [
                    Text(state.showdetails.name),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.showdetails.genres[0].name),
                        SizedBox(width: 10),
                        Text(state.showdetails.firstAirDate.substring(0, 4)),
                      ],
                    ),
                    Text("rating: " +
                        state.showdetails.voteAverage.toString() +
                        " votes: " +
                        state.showdetails.voteCount.toString()),
                    Card(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          
                          child: Image.network(
                            imageBaseUrl + state.showdetails.posterPath,
                            height: 150,
                            width: 100,
                            
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Total Binge Time",
                                style: TextStyle( fontSize: 20),
                              ),
                              Text(
                                "7 days 3 hours 20 mins",
                                style: TextStyle( fontSize: 20),
                              ),
                              Text(
                                "Seasons: " +
                                    state.showdetails.numberOfSeasons
                                        .toString(),
                                style: TextStyle( fontSize: 20),
                              ),
                              Text(
                                "Episodes: " +
                                    state.showdetails.numberOfEpisodes
                                        .toString(),
                                style: TextStyle( fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ]);
            else
              return Text('Loading');
          },
        ),
      ),
    );
  }
}
