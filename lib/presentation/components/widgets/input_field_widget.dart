import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/utils/colors.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        fillColor: kTextFieldFillColor,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldFillColor, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldFillColor, width: 3.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
