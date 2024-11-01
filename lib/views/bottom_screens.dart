import 'package:flutter/material.dart';
import 'package:zoomio_driverapp/data/services/auth_services.dart';
import 'package:zoomio_driverapp/views/auth_screens/signin_screen.dart';
import 'package:zoomio_driverapp/views/homepage_screens/home.dart';
import 'package:zoomio_driverapp/views/homepage_screens/notifications.dart';
import 'package:zoomio_driverapp/views/homepage_screens/profile.dart';
import 'package:zoomio_driverapp/views/styles/app_styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomScreens extends StatefulWidget {
  final String? email;
  final String? displayName;
  BottomScreens({super.key, this.displayName, this.email});

  @override
  _BottomScreensState createState() => _BottomScreensState();
}

class _BottomScreensState extends State<BottomScreens> {
  final AuthServices auth = AuthServices();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Replace these with your actual screen widgets
    HomeScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: Container(
        color: ThemeColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: GNav(
            backgroundColor: ThemeColors.primaryColor,
            color: ThemeColors.titleColor,
            activeColor: ThemeColors.primaryColor,
            iconSize: 24,
            tabBackgroundColor: ThemeColors.titleColor,
            padding: const EdgeInsets.all(10),
            onTabChange: _onItemTapped,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.notifications,
                text: "Notifications",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
