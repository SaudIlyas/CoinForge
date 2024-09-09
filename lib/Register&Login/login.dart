import 'dart:convert';

import 'package:coinforge/Screens/welcome_screen.dart';
import 'package:coinforge/navbar.dart';
import 'package:coinforge/utils/users.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    // Call your function here
   // loadUserData();
  }

  // Future<void> loadPreferences() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     email = prefs.getString('email') ?? '';
  //     password = prefs.getString('password') ?? '';
  //   });
  // }

  Future<User?> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String usersString = prefs.getString('users') ?? "";
    List users = jsonDecode(usersString);
    for (int i = 0; i < users.length; i++) {
      User obj = User();
      obj.email = users[i]["email"];
      obj.password = users[i]["password"];
      if (obj.email ==  _emailController.text) {
        setState(() {
          email = obj.email;
          password = obj.password;
          print(email);
          print(password);
        });
      }
    }
    return null;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue.shade100,
          title: const Text("Error"),
          content: const Text("Incorrect Email or Password"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
        }, icon: const Icon(Icons.close_rounded)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,top: 8,right: 16,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/Images/logo1.png"))
                        ),
                      ),
                      const Text(style: TextStyle( fontSize: 30, color: Color.fromRGBO(0, 3, 252, 1), fontWeight: FontWeight.bold),"  CoinForge")
                    ],
                  ),
                  const SizedBox(height: 30,),
                  const Text("Welcome Back!", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  const Text("Please Login to Continue", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 50,),
                  const Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black54
                    ),
                    decoration: InputDecoration(
                      focusColor: Colors.blueAccent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Password", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: _passwordController,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black54,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      suffixIconColor: Colors.black,
                      focusColor: const Color.fromRGBO(0, 3, 252, 1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Row(
                          children: [
                            Icon(Icons.check_box_rounded, color: Colors.blueAccent,),
                            Text(" Remember me", style: TextStyle(color: Colors.black),)
                          ],
                        ),
                      ),
                      TextButton(onPressed: (){}, child: const Text("Forgot Password?", style: TextStyle(color: Colors.blueAccent),))
                    ],
                  ),
                  const SizedBox(height: 40,),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).width*0.15,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(15, 75, 167, 1)),
                      ),
                      onPressed: () async{
                        await loadUserData();
                        if(_emailController.text == email && _passwordController.text == password){
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('loggedEmail', _emailController.text);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const  NavigationMenu()));
                        } else {
                          _showErrorDialog();
                        }
                      },
                      child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
