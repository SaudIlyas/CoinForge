import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coinforge/Screens/welcome_screen.dart';
import 'package:coinforge/navbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String email = "";

  @override
  void initState() {
    super.initState();
    // Call your function here
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('loggedEmail') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/Animations/SplashScreen.json"),
          ],
        ),
        splashIconSize: 800,
        animationDuration: const Duration(milliseconds: 90),
        nextScreen: email == "" ? const WelcomeScreen(): const NavigationMenu(),
        backgroundColor: Colors.blueAccent,
    );
  }
}
