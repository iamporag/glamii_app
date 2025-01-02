// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'src/presentation/screens/calendar_screen.dart';
import 'src/presentation/screens/categories_screen.dart';
import 'src/presentation/screens/profile_screen.dart';
import 'widgets/featured_services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // The current index of the selected bottom navigation item
  int _selectedIndex = 0;

  // List of screens for each navigation tab
  final List<Widget> _screens = [
    FeaturedServicesScreen(), // Home (Featured Services)
    CategoriesScreen(), // Categories
    const CalendarScreen(), // Calendar
    // RewardsWalletScreen(), // Rewards Wallet
    const ProfileScreen(), // Profile
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
      body: _screens[_selectedIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF75140c),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Handle tab change
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