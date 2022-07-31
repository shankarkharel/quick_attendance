import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/screens/enroll_into_new_course.dart';
import 'package:quick_attendance/presentation/screens/login_screen.dart';

import 'presentation/screens/autofilled_form.dart';
import 'presentation/screens/home_screen.dart';
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
        '/enroll': (context) => const MyWidget(),
        '/autoFilled': (context) => const AutoFilledForm(
              qrdata: '',
              studentId: '',
            ),
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
