import 'dart:math';
import 'package:flutter/material.dart';

class EquationResultScreen extends StatefulWidget {
  final double coefA;
  final double coefB;
  final double coefC;

  const EquationResultScreen({
    required this.coefA,
    required this.coefB,
    required this.coefC,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _EquationResultScreenState();
}

class _EquationResultScreenState extends State<EquationResultScreen> {
  double? x1;
  double? x2;
  late double d;

  @override
  void initState() {
    super.initState();
    _calculateRoots();
  }

  void _calculateRoots() {
    final double sqrtD =
        sqrt(widget.coefB * widget.coefB - 4 * widget.coefA * widget.coefC);

    if (sqrtD >= 0) {
      x1 = (-widget.coefB + sqrtD) / (2 * widget.coefA);
      x2 = (-widget.coefB - sqrtD) / (2 * widget.coefA);
    }
    d = sqrtD;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "D=${d >= 0 ? d : "Подкоренное выражение отрицательное"}",
                style: const TextStyle(fontSize: 18.0),
              ),
              Visibility(
                  visible: x1 == null && x2 == null,
                  child: Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: const Text(
                        "Корней не существует",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ))),
              Visibility(
                  visible: !(x1 == null),
                  child:
                      Text('X1=$x1', style: const TextStyle(fontSize: 18.0))),
              Visibility(
                visible: !(x2 == null),
                child: Text('X2=$x2', style: const TextStyle(fontSize: 18.0)),
              ),
            ],
          )),
    );
  }
}
