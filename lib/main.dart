import 'package:flutter/material.dart';
import 'package:tvbc_flutter/television_binge_calc.dart';
import 'package:tvbc_repository/tvbc_repository.dart';

void main() {
 
  runApp(
    TelevisionBingeCalc(
      tvbcRepository: TvbcRepository(),
    ),
  );
}