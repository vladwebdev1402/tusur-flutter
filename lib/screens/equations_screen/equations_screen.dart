import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/screens/equations_screen/cubit/equations_screen_cubit.dart';
import 'package:tusur_flutter/screens/equations_screen/cubit/equations_screen_state.dart';
import 'package:tusur_flutter/shared/helpers.dart';

class EquationsScreen extends StatelessWidget {
  const EquationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("История уравнений"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: BlocBuilder<EquationsScreenCubit, EquationsScreenState>(
          builder: (context, state) {
        if (state is EquationsScreenUpdateState) {
          return ListView.separated(
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'A = ${coefToString(state.equations[index].coefA)}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              'B = ${coefToString(state.equations[index].coefB)}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              'C = ${coefToString(state.equations[index].coefC)}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'D = ${state.equations[index].d ?? "Дискриминант не найден"}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            Visibility(
                              visible: !(state.equations[index].x1 == null),
                              child: Text(
                                'x1 = ${coefToString(state.equations[index].x1)}',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Visibility(
                              visible: !(state.equations[index].x2 == null),
                              child: Text(
                                'x2 = ${coefToString(state.equations[index].x2)}',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.equations.length);
        }

        return Container();
      }),
    );
  }
}
