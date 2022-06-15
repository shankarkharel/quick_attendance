import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/screens/login_screen.dart';

import 'home_page.dart';
import 'presentation/screens/register_screen.dart';

void main() {
  runApp(const QuickAttendance());
}

class QuickAttendance extends StatelessWidget {
  const QuickAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomePage(),
      },
      title: 'Quick Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
