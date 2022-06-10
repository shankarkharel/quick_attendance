import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_grey_shadowed_button.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/screens/login_screen.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'personIcon',
              child: RoundedPersonIcon(),
            ),
            marginSpace(vertical: 10),
            RoundedGreyShadowedButton(
              text: "Log In",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
            marginSpace(vertical: 10),
            RoundedGreyShadowedButton(
              text: 'Register',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
