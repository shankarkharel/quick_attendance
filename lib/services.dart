// ignore_for_file: avoid_print, prefer_collection_literals, constant_identifier_names, import_of_legacy_library_into_null_safe, deprecated_member_use

import 'dart:convert';
import 'dart:developer';
//import http package to make http requests
import 'package:http/http.dart' as http;
import 'models/student.dart';

class Services {
  static Uri url = Uri.parse('http://localhost/qr_attendance_api/index.php');
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_STD_ACTION = 'ADD_STD';
  static const _UPDATE_STD_ACTION = 'UPDATE_STD';
  static const _DELETE_STD_ACTION = 'DELETE_STD';

  // Method to create the table Student.
  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(url, body: map);
      log('Create Table Response: ${response.toString()}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      log('Create Table ERROR: $e');
      return "error";
    }
  }

  static Future<List<Student>> getStudents() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(url, body: map);
      log('getStudent Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Student> list = parseResponse(response.body);
        return list;
      } else {
        //return a list litral
        List<Student> growableList = List<Student>.filled(500,
            Student(roll: '', name: '', email: '', password: '', phone: ''));
        log('growableList: $growableList');
        return growableList;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static List<Student> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Student>((json) => Student.fromJson(json)).toList();
  }

  // Method to add Student to the database...
  static Future<String> addStudent(String name, String email, String roll,
      String password, String phone) async {
    log('addStudent: $name, $email, $roll, $password, $phone');
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_STD_ACTION;
      map['name'] = name;
      map['email'] = email;
      map['roll'] = roll;
      map['password'] = password;
      map['phone'] = phone;
      final response = await http.post(url, body: map);
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an Student in Database...
  static Future<String> updateStudent(String roll, String name, String password,
      String email, String phone) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_STD_ACTION;
      map['roll'] = roll;
      map['name'] = name;
      map['email'] = email;
      map['password'] = password;
      map['phone'] = phone;
      final response = await http.post(url, body: map);
      print('updateStudent Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Student from Database...
  static Future<String> deleteStudent(String roll) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_STD_ACTION;
      map['roll'] = roll;
      final response = await http.post(url, body: map);
      print('deletStudent Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}
