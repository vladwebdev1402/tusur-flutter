import 'package:flutter/material.dart';
import 'package:tusur_flutter/src/form/quadratic_equation_form.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Кривенко В. В. "),
        backgroundColor: Colors.purpleAccent,
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(24.0),
        child: QuadraticEquationForm(),
      )),
    );
  }
}
