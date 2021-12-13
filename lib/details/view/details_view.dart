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
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(
                              20) // use instead of BorderRadius.all(Radius.circular(20))
                          ),
                      child: Row(
                        children: [
                          Image.network(
                            imageBaseUrl + state.showdetails.posterPath,
                            height: 300,
                            width: 300,
                          ),
                        ],
                      )),
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
