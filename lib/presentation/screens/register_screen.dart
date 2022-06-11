import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/input_field_widget.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_grey_shadowed_button.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/screens/login_screen.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              marginSpace(vertical: screenSize.height * 0.06),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
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
                hintText: 'Name',
              ),
              marginSpace(vertical: 10),
              const InputFieldWidget(
                hintText: 'Email',
              ),
              marginSpace(vertical: 10),
              const InputFieldWidget(
                hintText: 'Phone',
              ),
              marginSpace(vertical: 10),
              const InputFieldWidget(
                hintText: 'Password',
                isPassword: true,
              ),
              marginSpace(vertical: 20),
              RoundedGreyShadowedButton(text: 'Register', onTap: () {}),
              marginSpace(vertical: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Already A User? Log In",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              marginSpace(vertical: 20),
            ],
          ),
        ),
      ),
    );
  }
}
