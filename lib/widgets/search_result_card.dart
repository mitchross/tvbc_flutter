import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvbc_flutter/home/models/search_result.dart';

class SearchResultCard extends StatelessWidget {
  final SearchResult searchResult;
  final String imageBaseUrl = "https://image.tmdb.org/t/p/w500/";

  const SearchResultCard({Key key, this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ColoredBox(color: Colors.red,child: 
    Column(
      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 110,
          height: 169,
          decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageBaseUrl + searchResult.imageLink))),
        ),
                  Padding(
            padding: EdgeInsets.all(5),
            child: Text(searchResult.title),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Score: " + searchResult.score.toString()),
          )
      ],
      
    )
    );
  }
}
