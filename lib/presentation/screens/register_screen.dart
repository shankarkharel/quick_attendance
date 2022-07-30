// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quick_attendance/services.dart';

import '../components/widgets/custom_form_field.dart';
import '../components/widgets/neumorphic_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rollController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rollController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    Services.createTable().then((result) {
      if ('ConnectedsuccessCreate' == result) {
        print('Table is created successfully.');
      } else {
        log('Error creating table');
      }
    });
  }

  _addStd() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _rollController.text.isEmpty ||
        _phoneController.text.isEmpty) {
      log('Empty Fields');
      return;
    }

    Services.addStudent(
            _nameController.text,
            _emailController.text,
            _rollController.text,
            _passwordController.text,
            _phoneController.text)
        .then((result) {
      // Table is created successfully.
      log('data added successfully. $result');
    });

    if (formKey.currentState!.validate() &&
        _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _rollController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      Navigator.pushNamed(context, '/home');
    }
  }

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
                    CustomTextFormField(
                      hintText: "FirstName LastName",
                      label: 'Enter Your name',
                      controller: _nameController,
                      errorText: 'pleasse Enter a Correct name',
                      regExpSrc: r'^[a-zA-Z ]+$',
                    ),
                    marginSpace(vertical: screenSize.height * 0.06),
                    CustomTextFormField(
                        hintText: 'example@gmail.com',
                        label: 'Enter Your Email',
                        controller: _emailController,
                        errorText: 'Please  email corect Email',
                        regExpSrc:
                            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'),
                    marginSpace(vertical: screenSize.height * 0.06),
                    CustomTextFormField(
                        hintText: 'minimum 10 numbers',
                        label: 'Enter your Phone Number',
                        controller: _phoneController,
                        errorText: 'please Enter a valid phone number',
                        regExpSrc: r'^[0-9]{10}$'),
                    marginSpace(vertical: screenSize.height * 0.06),
                    CustomTextFormField(
                      regExpSrc: r'[a-zA-Z]+_[0-9]+',
                      hintText: 'Faculty_Your_Exam_Roll_Number',
                      label: 'Enter Your Role number ',
                      controller: _rollController,
                      errorText: 'eg:BSE_20180083',
                    ),
                    marginSpace(vertical: screenSize.height * 0.06),
                    CustomTextFormField(
                      hintText: 'minimum 5 characters',
                      label: 'Enter Your Password',
                      controller: _passwordController,
                      errorText:
                          'Please  enter a password at least 5 characters',
                      regExpSrc: r'^.{5,}$',
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
                          onPressed: _addStd,
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
