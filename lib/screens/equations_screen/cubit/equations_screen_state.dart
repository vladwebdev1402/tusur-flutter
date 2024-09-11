import 'package:tusur_flutter/screens/equations_screen/cubit/type.dart';

abstract class EquationsScreenState {}

class EquationsScreenUpdateState extends EquationsScreenState {
  List<Equation> equations;

  EquationsScreenUpdateState({required this.equations});
}
