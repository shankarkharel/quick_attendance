import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/utils/colors.dart';

class RoundedGreyShadowedButton extends StatelessWidget {
  const RoundedGreyShadowedButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20, right: 60, left: 60),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            kButtonBoxShadow
          ],
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: kButtonTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
