import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Services', style: Theme.of(context).textTheme.headlineMedium),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Featured services carousel
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Explore our services', style: Theme.of(context).textTheme.headlineMedium),
          ),
          // Add more content widgets like service lists, cards, etc.
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: const Color(0xFF75140c),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
