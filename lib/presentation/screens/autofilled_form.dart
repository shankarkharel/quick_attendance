// ignore_for_file: deprecated_member_use, unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_attendance/services.dart';
import 'package:geolocator/geolocator.dart';

class AutoFilledForm extends StatefulWidget {
  final String qrdata;
  final String studentId;
  const AutoFilledForm(
      {Key? key, required this.qrdata, required this.studentId})
      : super(key: key);

  @override
  State<AutoFilledForm> createState() => _AutoFilledFormState();
}

class _AutoFilledFormState extends State<AutoFilledForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _facultyController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();

  void decode(String qrdata) {
    //seperate the data into nameof teacher, faculty, course and location .
    final splitted = qrdata.split(' ');
    String teacherName = splitted[0] + splitted[1];
    String faculty = splitted[2];
    String course = splitted[3];
    String location = splitted[4];
    _nameController.text = teacherName;
    _rollController.text = widget.studentId;
    _courseController.text = course;
    _addressController.text = location;
    _facultyController.text = faculty;
  }

  static const snackBar = SnackBar(
    content: Text('Your Attendance has been marked'),
  );

  _updateStudent() {
    String table = "Project1_BSE4";
    // _courseController.text + "_" + _facultyController.text

    Services.updateStudent(widget.studentId, table).then((result) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      log('Update Employee Result: $result');
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
    Geolocator.getCurrentPosition().then((position) {
      log('Latitude: ${position.latitude}');
      log('Longitude: ${position.longitude}');
    });

    decode(widget.qrdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 90,
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                icon: Icon(Icons.location_on),
              ),
            ),
            TextFormField(
              controller: _courseController,
              decoration: const InputDecoration(
                icon: Icon(Icons.book),
              ),
            ),
            TextFormField(
              controller: _rollController,
              decoration: const InputDecoration(
                icon: Icon(Icons.list),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: RaisedButton(
                onPressed: () {
                  _updateStudent();
                },
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
