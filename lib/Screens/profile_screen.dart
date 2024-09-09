import 'dart:convert';

import 'package:coinforge/Register&Login/login.dart';
import 'package:coinforge/Screens/language_screen.dart';
import 'package:coinforge/Screens/notification_screen.dart';
import 'package:coinforge/Screens/privacy_policy_screen.dart';
import 'package:coinforge/Screens/profile_edit_screen.dart';
import 'package:coinforge/utils/users.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<User> userModel = [];

  String firstName = "";
  String lastName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  // void loadUserData() async {
  //   User? user = await User.getUserFromPrefs();
  //   if (user != null) {
  //     setState(() {
  //       firstName = user.firstName;
  //       lastName = user.lastName;
  //       email = user.email;
  //     });
  //   }
  // }

  Future<User?> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String usersString = prefs.getString('users')??"";
      List users = jsonDecode(usersString);
    for(int i=0;i<users.length;i++){

      User obj= User();
      obj.firstName = users[i]["firstName"];
      obj.lastName = users[i]["lastName"];
      obj.email = users[i]["email"];
      String loggedEmail = prefs.getString('loggedEmail')?? "";
      if(obj.email == loggedEmail){
        setState(() {
          firstName = obj.firstName;
          lastName = obj.lastName;
          email = obj.email;
        });
      }
    }

    return null;
  }

  // Future<void> loadPreferences() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   setState(() {
  //     firstName = prefs.getString('firstName') ?? '';
  //     lastName = prefs.getString('lastName') ?? '';
  //     email = prefs.getString('email') ?? '';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).width*0.45,
                  ),
                  const Positioned(
                    left: 20,
                    right: 20,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(83, 188, 252, 0.5),
                      radius: 50,
                      child: Icon(Icons.person, size: 30,),
                    ),
                  ),
                  const Positioned(
                    left: 90,
                    right: 1,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Color.fromRGBO(207, 219, 227, 0.8),
                      child: Icon(Icons.edit, color: Colors.black, size: 17,),
                    ),
                  )
                ],
              ),
              Text("$firstName $lastName", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(email),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.edit_note_rounded),
                        title: const Text("Edit profile information"),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileEditScreen()));
                        },
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications_none),
                        title: const Text("Notifications"),
                        trailing: const Text("ON", style: TextStyle(color: Colors.blue),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationsScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.translate_rounded),
                        title: const Text("Language"),
                        trailing: const Text("English", style: TextStyle(color: Colors.blue),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LanguageScreen()));
                        },
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.security_rounded),
                        title: const Text("Security"),
                        onTap: () {},
                        shape: const  RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.brush_rounded),
                        title: const Text("Theme"),
                        trailing: const Text("Light Mode", style: TextStyle(color: Colors.blue),),
                        onTap: () {},
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.contact_support_outlined),
                        title: const Text("Help & Support"),
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileEditScreen()));
                        },
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.message_outlined),
                        title: const Text("Contact us"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.privacy_tip_outlined),
                        title: const Text("Privacy Policy"),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const PrivacyPolicyScreen()));
                        },
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout_rounded),
                        title: const Text("Log Out"),
                        onTap: () async {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.remove('loggedEmail');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
                        },
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
