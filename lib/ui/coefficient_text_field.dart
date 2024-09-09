import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoefficientTextField extends StatelessWidget {
  final String _coeff;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onSubmitted;

  const CoefficientTextField(
      this._coeff, this.controller, this.focusNode, this.onSubmitted,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.-]'))],
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 16.0),
          labelStyle: const TextStyle(fontSize: 16.0),
          labelText: _coeff),
      keyboardType: TextInputType.number,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: (value) => onSubmitted(),
      style: const TextStyle(fontSize: 24.0),
      validator: (value) {
        if (value!.isEmpty) return "Введите значение коэффициента";
        if (!RegExp(r'((^|, )([-]{0,1}[0-9]+[.]{0,1}[0-9]+|[-]{0,1}[0-9]+))+$')
            .hasMatch(value)) {
          return "Число введено неккоретно";
        }
        return null;
      },
    );
  }
}
