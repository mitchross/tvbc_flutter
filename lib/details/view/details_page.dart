import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvbc_flutter/details/cubit/showdetails_cubit.dart';
import 'package:tvbc_flutter/details/view/details_view2.dart';
import 'package:tvbc_repository/tvbc_repository.dart';

class DetailsPage extends StatelessWidget {
  final String id;

  const DetailsPage({Key? key, required this.id}) : super(key: key);

    static Route route({required String id}) {
    return MaterialPageRoute<void>(
      builder: (context) => DetailsPage(id: id),
    );
  } 

  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
      child: Padding
      ( padding: const EdgeInsets.symmetric(horizontal: 0),
        child: 
           
           BlocProvider(
                create: (context) => ShowdetailsCubit(
                  context.read<TvbcRepository>()
                )..getTvShowById(id: id),
                child: DetailsView2(),
              ),
             
          
        ),
        ),
    );
  }


}