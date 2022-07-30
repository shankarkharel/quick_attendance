// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_attendance/models/student.dart';
import 'package:quick_attendance/presentation/components/widgets/custom_form_field.dart';
import 'package:quick_attendance/presentation/components/widgets/neumorphic_button.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';
import 'package:quick_attendance/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late List<Student> _students;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _students = [];

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  _getStudents() {
    log("inside getstudent");

    Services.getStudents().then((students) {
      {
        _students = students;
        log("inside getstudent res");
      }
      log("Length ${students.length}");
    });
    _validate();
  }

  _validate() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      log('Empty Fields');
      return;
    }
    for (var student in _students) {
      log("${student.email} ${student.password}");
      if (student.email == _emailController.text &&
          student.password == _passwordController.text) {
        log('Login Successful');
        Navigator.pushNamed(context, '/home');
        return;
      }
    }
    log('Login Failed');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Log In",
              style: kHeaderTextStyle,
              textAlign: TextAlign.center,
            ),
            marginSpace(vertical: 30),
            const Hero(
              tag: 'personIcon',
              child: RoundedPersonIcon(
                size: 120,
              ),
            ),
            marginSpace(vertical: screenSize.height * 0.06),
            marginSpace(vertical: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: "examplle@gmail.com",
                    label: 'Enter Your Email',
                    controller: _emailController,
                    errorText: 'Please  enter corect Email',
                    regExpSrc:
                        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                  ),
                  marginSpace(vertical: screenSize.height * 0.06),
                  CustomTextFormField(
                    hintText: 'minimum 5 characters',
                    label: 'Enter Your Password',
                    controller: _passwordController,
                    errorText: 'Please  enter a password at least 5 characters',
                    regExpSrc: r'^.{5,}$',
                  ),
                  marginSpace(vertical: 20),
                  Row(
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                      const Spacer(),
                      CustomNeumorphicButton(
                        onPressed: _getStudents,
                        formKey: formKey,
                        screen: '/home',
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: _validate,
                    child: const Text(
                      "Don't have an Account? Register",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
