import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tvbc_flutter/home/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvbc_flutter/home/models/search_result.dart';

import 'package:tvbc_flutter/widgets/search_bar.dart';
import 'package:tvbc_flutter/widgets/search_result_card.dart';
import 'package:tvbc_repository/tvbc_repository.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: SearchBar(
            onSubmitted: (value) {
              context.read<SearchCubit>().getTVSearchResults(searchTerm: value);
            },
          ),
          
        ),
        Row(children: [
          TextButton(onPressed: null, child: Text("TV")),
          TextButton(onPressed: null, child: Text("Movies"))
        ],),
        Flexible(
         
          child: Align(
            alignment: Alignment.bottomCenter,
            
            child: BlocBuilder<SearchCubit, SearchState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            switch (state.status) {
              case SearchStatus.loading:
                return const _SearchLoading();
              case SearchStatus.success:
                return _SearchSuccess(searchResults: state.searchResults);
              default:
                return const _SearchFailure();
            }
          },
        )
        )
        )
      ],
    );
  }
}

class _SearchSuccess extends StatelessWidget {
  const _SearchSuccess({Key key, this.searchResults}) : super(key: key);

  final List<SearchResult> searchResults;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) ;
    final double itemWidth = (size.width);



    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: itemWidth/itemHeight,
        mainAxisSpacing: 2,
        crossAxisSpacing: 12,
        crossAxisCount: 3,
      ),
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final searchResult = searchResults[index];
        return SearchResultCard(searchResult: searchResult);
      },
    );
  }
}

class _SearchLoading extends StatelessWidget {
  const _SearchLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      key: const Key('synonyms_loading_shimmer'),
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Column(
        children: [
          Container(height: 48.0, color: Colors.white),
          const SizedBox(height: 16),
          Container(height: 300.0, color: Colors.white),
        ],
      ),
    );
  }
}

class _SearchFailure extends StatelessWidget {
  const _SearchFailure({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('search_failure'),
      child: Icon(Icons.warning, color: Colors.redAccent),
    );
  }
}
