import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvbc_flutter/home/models/search_result.dart';

class SearchResultCard extends StatelessWidget {
  final SearchResult searchResult;
  final String imageBaseUrl = "https://image.tmdb.org/t/p/w500/";

  const SearchResultCard({Key key, this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: [
        Container(
          width: 360,
          height: 250,
          decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageBaseUrl + searchResult.imageLink))),
        ),
      ],
      )
    );
    // Container(
    //     padding: const EdgeInsets.all(6),
    //     height: 360,
    //     width: 250,
    //     key: const Key('search_result_card'),
    //     child: Column(children: <Widget>[
    //       Container(
    //         padding: EdgeInsets.all(10),
    //         width: 50,
    //         height: 50,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             image: DecorationImage(
    //                 fit: BoxFit.fill,
    //                 image:
    //                     NetworkImage(imageBaseUrl + searchResult.imageLink))),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(5),
    //         child: Text(searchResult.title),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(5),
    //         child: Text("Score: " + searchResult.score.toString()),
    //       )
    //     ]));
  }
}
