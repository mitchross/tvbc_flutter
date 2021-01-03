import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvbc_flutter/home/cubit/search_cubit.dart';

import 'package:tvbc_flutter/home/view/home_view.dart';
import 'package:tvbc_repository/tvbc_repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
      child: Padding
      ( padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: 
           
           BlocProvider(
                create: (context) => SearchCubit(
                  context.read<TvbcRepository>(),
                ),
                child: HomeView(),
              ),
             
          
        ),
        ),
    );
  }
}
