import 'package:flutter/material.dart';

SizedBox marginSpace({double horizontal = 0, double vertical = 0}) {
  return SizedBox(
    width: horizontal,
    height: vertical,
  );
}

navigateTo(BuildContext context, Widget route) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => route,
    ),
  );
}
