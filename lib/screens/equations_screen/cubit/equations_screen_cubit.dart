import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/screens/equations_screen/cubit/equations_screen_state.dart';
import 'package:tusur_flutter/screens/equations_screen/cubit/type.dart';
import 'package:tusur_flutter/services/db.dart';

class EquationsScreenCubit extends Cubit<EquationsScreenState> {
  EquationsScreenCubit() : super(EquationsScreenUpdateState(equations: []));

  List<Equation> equations = [];

  Future<void> fetchEquations() async {
    final List<Map<String, dynamic>> data = await DBProvier.db.getEquations();
    equations = Equations.fromJson(data);
    emit(EquationsScreenUpdateState(equations: equations));
  }
}
