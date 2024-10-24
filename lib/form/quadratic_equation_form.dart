import 'package:flutter/material.dart';
import 'package:tusur_flutter/ui/coefficient_text_field.dart';

class EquationFormType {
  final String coefA;
  final String coefB;
  final String coefC;

  const EquationFormType(
      {required this.coefA, required this.coefB, required this.coefC});
}

class QuadraticEquationForm extends StatefulWidget {
  final Function(double a, double b, double c) onSubmit;
  final EquationFormType baseValues;

  const QuadraticEquationForm(
      {super.key, required this.onSubmit, required this.baseValues});

  @override
  State<QuadraticEquationForm> createState() => _QuadraticEquationFormState();
}

class _QuadraticEquationFormState extends State<QuadraticEquationForm> {
  bool _isAgreement = false;
  bool _isAgreementError = false;

  final _formKey = GlobalKey<FormState>();

  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();
  final _controllerC = TextEditingController();

  final _focusA = FocusNode();
  final _focusB = FocusNode();
  final _focusC = FocusNode();

  _handleCalcPressed() {
    if (_formKey.currentState!.validate() && _isAgreement) {
      widget.onSubmit(double.parse(_controllerA.text),
          double.parse(_controllerB.text), double.parse(_controllerC.text));
    }

    if (!_isAgreement) {
      setState(() => _isAgreementError = true);
    } else {
      setState(() => _isAgreementError = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerA.text = widget.baseValues.coefA;
    _controllerB.text = widget.baseValues.coefB;
    _controllerC.text = widget.baseValues.coefC;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CoefficientTextField(
            coeff: "A:",
            controller: _controllerA,
            focusNode: _focusA,
            onSubmitted: () => _focusB.requestFocus(),
            isNotZero: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CoefficientTextField(
              coeff: "B:",
              controller: _controllerB,
              focusNode: _focusB,
              onSubmitted: () => _focusC.requestFocus()),
          const SizedBox(
            height: 16.0,
          ),
          CoefficientTextField(
              coeff: "C:",
              controller: _controllerC,
              focusNode: _focusC,
              onSubmitted: () => _handleCalcPressed()),
          const SizedBox(
            height: 16.0,
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _isAgreement,
            isError: _isAgreementError,
            onChanged: (value) => setState(() {
              _isAgreement = value!;
              if (value) _isAgreementError = false;
            }),
            title: Text(
              "Я согласен на обработку персональных данных",
              style: TextStyle(
                  color: _isAgreementError ? Colors.red[900] : Colors.black87),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          FilledButton(
              onPressed: _handleCalcPressed, child: const Text("Рассчитать"))
        ],
      ),
    );
  }
}
