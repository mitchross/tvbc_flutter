
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tvbc_flutter/home/models/search_result.dart';

class SearchResultCard extends StatelessWidget {
  final SearchResult searchResult;
  final String imageBaseUrl = "https://image.tmdb.org/t/p/w500/";

  const SearchResultCard({Key key, this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String imageUrl = imageBaseUrl + ( searchResult.imageLink !=null ?searchResult.imageLink : "");


    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child:  FadeInImage.assetNetwork(
              image: imageUrl,
              placeholder: 'assets/images/circular_progress_indicator.gif',
             
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Column(
            children: <Widget>[
             Text(
                searchResult.title,
              ),
             
              SizedBox(
                height: 8,
              ),
              Text("Score: " + searchResult.score.toString())
            ],
          ),
        ),
      ],
    );
  }
}
