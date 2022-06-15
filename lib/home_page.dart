import 'package:flutter/material.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/utils/colors.dart';
import 'package:quick_attendance/presentation/utils/reusables.dart';
import 'package:quick_attendance/presentation/utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              marginSpace(vertical: 100),
              const RoundedPersonIcon(
                size: 120,
              ),
              marginSpace(vertical: 40),
              Text(
                'Hello, Nishant Pokhrel',
                style: kHeaderTextStyle,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kQRScanButtonBgColor,
          onPressed: () {},
          child: Icon(
            Icons.qr_code,
            color: kQRScanButtonColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kBottomBarBackgroundColor,
          ),
          child: BottomNavigationBar(
              selectedItemColor: kBottomBarSelectedColor,
              unselectedItemColor: kBottomBarUnselectedColor,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Log Out',
                  icon: Icon(Icons.logout),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  Navigator.pushNamed(context, '/login');
                }
              }),
        ),
      ),
    );
  }
}
