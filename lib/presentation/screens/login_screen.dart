import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/input_field_widget.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_grey_shadowed_button.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/screens/register_screen.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
            marginSpace(vertical: 30),
            const InputFieldWidget(
              hintText: 'Email',
            ),
            marginSpace(vertical: 10),
            const InputFieldWidget(
              hintText: 'Password',
              isPassword: true,
            ),
            marginSpace(vertical: 20),
            RoundedGreyShadowedButton(
              text: 'Log In',
              onTap: () {},
            ),
            marginSpace(vertical: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                "Don't have an Account? Register",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
