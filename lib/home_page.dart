import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: const Icon(Icons.qr_code),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Log Out',
              icon: Icon(Icons.logout),
            )
          ],
        ),
        appBar: AppBar(title: const Text('Quick Attendance')),
        body: Center(
          child: Column(
            children: [
              marginSpace(vertical: 100),
              const RoundedPersonIcon(
                size: 120,
              ),
              marginSpace(vertical: 40),
              Text('Hello, Nishant Pokhrel', style: kHeaderTextStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
