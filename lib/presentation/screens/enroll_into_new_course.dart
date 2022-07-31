// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../models/student.dart';
import '../../services.dart';

// class Student {
//   final String id;
//   final String name;

//   Student({
//     required this.id,
//     required this.name,
//   });

//   factory Student.fromJson(Map<String, dynamic> jsonData) {
//     return Student(
//       id: jsonData['id'],
//       name: jsonData['name'],
//     );
//   }
// }

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      //FutureBuilder is a widget that builds itself based on the latest snapshot
      // of interaction with a Future.
      child: FutureBuilder<List<Student>>(
        future: Services.getStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Student>? spacecrafts = snapshot.data;
            return CustomListView(spacecrafts!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          //return  a circular progress indicator.
          return const CircularProgressIndicator();
        },
      ),
    ));
  }
}

class CustomListView extends StatelessWidget {
  final List<Student> student;

  // ignore: use_key_in_widget_constructors
  const CustomListView(this.student);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: student.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(student[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Student std, BuildContext context) {
    return ListTile(
        title: Card(
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                      child: Text(
                        std.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: const EdgeInsets.all(1.0)),
                  const Text(" | "),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {});
  }
}
