import 'dart:math';
import 'package:flutter/material.dart';

class EquationResultScreen extends StatelessWidget {
  double? _x1;
  double? _x2;
  double _d = 0.0;

  EquationResultScreen({
    required double coefA,
    required double coefB,
    required double coefC,
    super.key,
  }) {
    final double sqrtD = sqrt(coefB * coefB - 4 * coefA * coefC);

    if (sqrtD >= 0) {
      _x1 = (-coefB + sqrtD) / (2 * coefA);
      _x2 = (-coefB - sqrtD) / (2 * coefA);
    }

    _d = sqrtD;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Кривенко В.В."),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                "D=${_d >= 0 ? _d : "Подкоренное выражение отрицательное"}",
                style: const TextStyle(fontSize: 18.0),
              ),
              Visibility(
                  visible: _x1 == null && _x2 == null,
                  child: Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: const Text(
                        "Корней не существует",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ))),
              Visibility(
                  visible: !(_x1 == null),
                  child:
                      Text('X1=$_x1', style: const TextStyle(fontSize: 18.0))),
              Visibility(
                visible: !(_x2 == null),
                child: Text('X2=$_x2', style: const TextStyle(fontSize: 18.0)),
              ),
            ],
          )),
    );
  }
}
