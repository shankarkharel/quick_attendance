import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_attendance/presentation/components/widgets/rounded_person_icon.dart';
import 'package:quick_attendance/presentation/screens/qr_view.dart';
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
                'Hello, user',
                style: kHeaderTextStyle,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kQRScanButtonBgColor,
          onPressed: () {
            checkCamera();

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Qrview(),
            ));
          },
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
                  icon: Icon(Icons.plus_one),
                ),
                BottomNavigationBarItem(
                  label: 'Log Out',
                  icon: Icon(Icons.logout),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/enroll');
                } else if (index == 1) {
                  Navigator.pushNamed(context, '/login');
                }
              }),
        ),
      ),
    );
  }

  Future<void> checkCamera() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      Permission.camera.request();
      log('Camera permission granted $status');
    }
  }
}
