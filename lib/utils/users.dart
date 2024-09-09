import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class User {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String countryCode = "";
  String phoneNumber = "";

  User();

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, password: $password, countryCode: $countryCode, phoneNumber: $phoneNumber)';
  }

  static Future<User?> getUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? usersString = prefs.getString('users');
    if (usersString != null) {
      List<User> users = User.decode(usersString);
      if (users.isNotEmpty) {
        return users.first; // Assuming the first user is the logged-in user
      }
    }
    return null;
  }

  // Convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
    };
  }

  // Convert a JSON map to a User object
  User.fromJson(Map<String, dynamic> json) {
      firstName = json['firstName'];
      lastName = json['lastName'];
      email = json['email'];
      password = json['password'];
      countryCode = json['countryCode'];
      phoneNumber = json['phoneNumber'];
  }

  // Convert a list of Users to JSON
  static String encode(List<User> users) => json.encode(
    users.map<Map<String, dynamic>>((user) => user.toJson()).toList(),
  );

  // Convert JSON to a list of Users
  static List<User> decode(String users) =>
      (json.decode(users) as List<dynamic>)
          .map<User>((item) => User.fromJson(item))
          .toList();
}