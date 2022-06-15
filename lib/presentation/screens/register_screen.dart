import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../components/widgets/custom_form_field.dart';
import '../components/widgets/neumorphic_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
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
              Text(
                "Register",
                style: kHeaderTextStyle,
                textAlign: TextAlign.center,
              ),
              marginSpace(vertical: 30),
              const Hero(
                tag: 'personIcon',
                child: RoundedPersonIcon(
                  size: 100,
                ),
              ),
              marginSpace(vertical: 30),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomTextFormField(
                      label: 'Enter Your name',
                      errorText: 'pleasse Enter a Correct name',
                      regExpSrc: r'^[a-zA-Z ]+$',
                    ),
                    marginSpace(vertical: screenSize.height * 0.06),
                    const CustomTextFormField(
                        label: 'Enter Your Email',
                        errorText: 'Please  email corect Email',
                        regExpSrc:
                            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'),
                    marginSpace(vertical: screenSize.height * 0.06),
                    const CustomTextFormField(
                        label: 'Enter your Phone Number',
                        errorText: 'please Enter a valid phone number',
                        regExpSrc: r'^[0-9]{10}$'),
                    marginSpace(vertical: screenSize.height * 0.06),
                    const CustomTextFormField(
                      label: 'Enter Your Role number ',
                      errorText: 'please Enter a correct Roll number',
                      regExpSrc: r'^[0-60]{1,2}$',
                    ),
                    marginSpace(vertical: screenSize.height * 0.06),
                    marginSpace(vertical: 20),
                    Row(
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        const Spacer(),
                        CustomNeumorphicButton(
                          formKey: formKey,
                          screen: '/login',
                        ),
                      ],
                    ),
                    marginSpace(vertical: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Already have an account? Login')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
