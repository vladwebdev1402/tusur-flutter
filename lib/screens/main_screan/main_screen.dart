import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/form/quadratic_equation_form.dart';
import 'package:tusur_flutter/screens/equations_screen/equations_screen_provider.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/main_screen_cubit.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/main_screen_state.dart';
import 'package:tusur_flutter/screens/main_screan/equation_result_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Function(double coefA, double coefB, double coefC) _onSubmitForm(
      BuildContext context) {
    return (double coefA, double coefB, double coefC) {
      BlocProvider.of<MainScreenCubit>(context)
          .calculateEqueationResult(coefA, coefB, coefC);
      BlocProvider.of<MainScreenCubit>(context).changeMode(ModeType.result);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EquationsScreenProvider()),
                );
              },
              icon: const Icon(Icons.list_rounded)),
          title: const Text("Кривенко В. В. "),
          backgroundColor: Colors.purpleAccent,
        ),
        body: BlocBuilder<MainScreenCubit, MainScreenState>(
            builder: (context, state) {
          if (state is MainScreenUpdateState) {
            if (state.mode == ModeType.form) {
              return SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: QuadraticEquationForm(
                  onSubmit: _onSubmitForm(context),
                  baseValues: EquationFormType(
                      coefA: state.coefA,
                      coefB: state.coefB,
                      coefC: state.coefC),
                ),
              ));
            }

            if (state.mode == ModeType.result) {
              return const EquationResultScreen();
            }
          }

          return Container();
        }));
  }
}
