import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusur_flutter/screens/main_screan/cubit/main_screen_cubit.dart';
import 'package:tusur_flutter/screens/main_screan/index.dart';

class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: const MainScreen(),
    );
  }
}
