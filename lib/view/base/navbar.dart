// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../screens/calendar/calendar_screen.dart';
import '../screens/category/categories_screen.dart';
import '../screens/feature_service/featured_services_screen.dart';
import '../screens/profile/profile_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // The current index of the selected bottom navigation item
  int _selectedIndex = 0;

  // List of screens for each navigation tab
  final List<Widget> _screens = [
    FeaturedServicesScreen(),
    CategoriesScreen(),
    const CalendarScreen(),
    // RewardsWalletScreen(),
    const ProfileScreen(),
  ];

  // Method to update the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF75140c),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.wallet_travel),
          //   label: 'Rewards',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
