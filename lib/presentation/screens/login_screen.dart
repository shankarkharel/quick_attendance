import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/custom_form_field.dart';
import 'package:quick_attendance/presentation/components/widgets/neumorphic_button.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

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
                  const CustomTextFormField(
                    label: 'Enter Your Email',
                    errorText: 'Please  email corect Email',
                    regExpSrc:
                        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                  ),
                  marginSpace(vertical: screenSize.height * 0.06),
                  const CustomTextFormField(
                    label: 'Enter Your Password',
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
                        formKey: formKey,
                        screen: '/home',
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
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
