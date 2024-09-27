import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoefficientTextField extends StatelessWidget {
  final String coeff;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onSubmitted;
  final bool? isNotZero;

  const CoefficientTextField(
      {required this.coeff,
      required this.controller,
      required this.focusNode,
      required this.onSubmitted,
      this.isNotZero,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.-]'))],
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 16.0),
          labelStyle: const TextStyle(fontSize: 16.0),
          errorMaxLines: 2,
          labelText: coeff),
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
        if (isNotZero != null && isNotZero! && value == '0') {
          return "Данный коэффициент не может быть равен 0";
        }
        return null;
      },
    );
  }
}
