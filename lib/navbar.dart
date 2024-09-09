import 'package:coinforge/Screens/home_screen.dart';
import 'package:coinforge/Screens/profile_screen.dart';
import 'package:coinforge/Screens/wallet_screen.dart';
import 'package:coinforge/Screens/withdraw_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromRGBO(15, 75, 167, 1),
              gap: 8,
              haptic: true,
              padding: const EdgeInsets.all(16),
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              selectedIndex: _currentIndex,
              tabs: const [
                GButton(icon: Icons.home_rounded, haptic: true, text: 'Home'),
                GButton(
                  icon: Icons.payments_rounded,
                  haptic: true,
                  text: 'Withdraw',
                ),
                GButton(
                  icon: Icons.wallet_rounded,
                  haptic: true,
                  text: 'Wallet',
                ),
                GButton(
                  icon: Icons.account_circle_rounded,
                  haptic: true,
                  text: 'Profile',
                ),
              ]),
        ),
      )
    );
  }
  List<Widget> screens = [const HomeScreen(),const WithdrawScreen(),const Wallet(), const ProfileScreen()];
}
