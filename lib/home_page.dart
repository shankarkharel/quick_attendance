import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.qr_code),
          ),
          appBar: AppBar(title: const Text('Quick Attendance')),
          body: const Center(child: Text('Welcome !'))),
    );
  }
}
