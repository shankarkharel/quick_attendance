import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String errorText;
  final String regExpSrc;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.errorText,
    required this.regExpSrc,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
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
