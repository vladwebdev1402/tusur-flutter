import 'package:flutter/material.dart';
import 'package:tusur_flutter/src/screens/index.dart';
import 'package:tusur_flutter/src/ui/coefficient_text_field.dart';

class QuadraticEquationForm extends StatefulWidget {
  const QuadraticEquationForm({super.key});
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EquationResultScreen(
                    coefA: double.parse(_controllerA.text),
                    coefB: double.parse(_controllerB.text),
                    coefC: double.parse(_controllerC.text),
                  )));
    }

    if (!_isAgreement) {
      setState(() => _isAgreementError = true);
    } else {
      setState(() => _isAgreementError = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CoefficientTextField(
              "A:", _controllerA, _focusA, () => _focusB.requestFocus()),
          const SizedBox(
            height: 16.0,
          ),
          CoefficientTextField(
              "B:", _controllerB, _focusB, () => _focusC.requestFocus()),
          const SizedBox(
            height: 16.0,
          ),
          CoefficientTextField(
              "C:", _controllerC, _focusC, () => _handleCalcPressed()),
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
