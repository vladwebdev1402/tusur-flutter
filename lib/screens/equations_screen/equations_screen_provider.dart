import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/screens/equations_screen/cubit/equations_screen_cubit.dart';
import 'package:tusur_flutter/screens/equations_screen/equations_screen.dart';

class EquationsScreenProvider extends StatelessWidget {
  const EquationsScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EquationsScreenCubit()..fetchEquations(),
      child: const EquationsScreen(),
    );
  }
}
