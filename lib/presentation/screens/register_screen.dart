import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/input_field_widget.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_grey_shadowed_button.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            const Text("Register", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600,), textAlign: TextAlign.center,),
            marginSpace(vertical: 30),
            const Hero(
              tag: 'personIcon',
              child: RoundedPersonIcon(
                size: 120,
              ),
            ),
            marginSpace(vertical: 30),
            const InputFieldWidget(),
            marginSpace(vertical: 10),
            const InputFieldWidget(),
            marginSpace(vertical: 20),
            RoundedGreyShadowedButton(text: 'Log In', onTap: (){})
          ],
        ),
      ),
    );
  }
}
