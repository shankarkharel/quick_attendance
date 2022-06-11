import 'package:flutter/material.dart';
import 'package:quick_attendance/home_page.dart';

void main() {
  runApp(const QuickAttendance());
}

class QuickAttendance extends StatelessWidget {
  const QuickAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
