import 'package:flutter/cupertino.dart';

import 'package:tvbc_flutter/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 20),
        child:
        SearchBar(
          onSubmitted: (value){
            
          } ,
          
        ))
      ],
    );
  }
}
