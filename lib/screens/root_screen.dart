import 'package:flutter/material.dart';
import 'package:online_course/components/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/main.dart';
import 'package:online_course/screens/favourite_screen.dart';
import 'package:online_course/screens/notification_screen.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  // List of screens for each tab in the BottomNavigationBar
  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  // Function to update the selected index when a tab is tapped
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],  // Display the current screen
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ]),
        child: bottomNavBar(),
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/home.png")),
            label: ''
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage("assets/icons/heart2.png")),
              label: ''
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage("assets/icons/bell.png")),
              label: ''
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(AssetImage("assets/icons/user.png")),
              label: ''
          ),
        ],
      );
  }
}
