import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvbc_flutter/home/view/home_page.dart';
import 'package:tvbc_repository/tvbc_repository.dart';

class TelevisionBingeCalc extends StatelessWidget {
  const TelevisionBingeCalc({
    Key key,
    @required TvbcRepository tvbcRepository,
  })  : assert(tvbcRepository != null),
        _tvbcRepository = tvbcRepository,
        super(key: key);

  final TvbcRepository _tvbcRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _tvbcRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            brightness: Brightness.light,
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87),
          ),
          textTheme: GoogleFonts.abrilFatfaceTextTheme(),
        ),
        home: HomePage(),
      ),
    );
  }
}
