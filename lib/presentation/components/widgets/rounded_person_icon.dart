import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/utils/colors.dart';

class RoundedPersonIcon extends StatelessWidget {
  const RoundedPersonIcon({
    Key? key,
    this.size = 80,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Icon(
        Icons.person,
        size: size,
        color: kRoundedPersonIconColor,
      ),
      decoration: BoxDecoration(
        color: kRoundedPersonBgColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
