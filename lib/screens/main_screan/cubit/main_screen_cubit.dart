import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/helpers.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit()
      : super(MainScreenUpdateState(
            mode: ModeType.form, d: 0.0, coefA: "", coefB: "", coefC: ""));

  ModeType mode = ModeType.form;
  double? x1;
  double? x2;
  double d = 0.0;
  String coefA = "";
  String coefB = "";
  String coefC = "";

  void changeMode(ModeType mode) {
    this.mode = mode;
    emit(MainScreenUpdateState(
      mode: mode,
      d: d,
      x1: x1,
      x2: x2,
      coefA: coefA,
      coefB: coefB,
      coefC: coefC,
    ));
  }

  void calculateEqueationResult(double coefA, double coefB, double coefC) {
    final double sqrtD = sqrt(coefB * coefB - 4 * coefA * coefC);

    if (sqrtD >= 0) {
      x1 = (-coefB + sqrtD) / (2 * coefA);
      x2 = (-coefB - sqrtD) / (2 * coefA);
    } else {
      x1 = null;
      x2 = null;
    }

    d = sqrtD;
    this.coefA = coefToString(coefA);
    this.coefB = coefToString(coefB);
    this.coefC = coefToString(coefC);

    emit(MainScreenUpdateState(
        mode: mode,
        x1: x1,
        x2: x2,
        d: d,
        coefA: this.coefA,
        coefB: this.coefB,
        coefC: this.coefC));
  }
}
