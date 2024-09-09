import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/main_screen_cubit.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/main_screen_state.dart';

class EquationResultScreen extends StatelessWidget {
  const EquationResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
      if (state is MainScreenUpdateState) {
        return Container(
            padding: const EdgeInsets.all(24.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "D=${state.d >= 0 ? state.d : "Подкоренное выражение отрицательное"}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18.0),
                ),
                Visibility(
                    visible: state.x1 == null && state.x2 == null,
                    child: Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: const Text(
                          "Корней не существует",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ))),
                Visibility(
                    visible: !(state.x1 == null),
                    child: Text('X1=${state.x1}',
                        style: const TextStyle(fontSize: 18.0))),
                Visibility(
                  visible: !(state.x2 == null),
                  child: Text('X2=${state.x2}',
                      style: const TextStyle(fontSize: 18.0)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                        onPressed: () {
                          BlocProvider.of<MainScreenCubit>(context)
                              .changeMode(ModeType.form);
                        },
                        child: const Text("Вернуться к форме")),
                  ],
                )
              ],
            ));
      }

      return Container();
    });
  }
}
