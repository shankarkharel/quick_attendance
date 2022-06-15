import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String errorText;
  final String regExpSrc;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.errorText,
    required this.regExpSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty || !RegExp(regExpSrc).hasMatch(value)) {
          return errorText;
        }
        return null;
      },
    );
  }
}
