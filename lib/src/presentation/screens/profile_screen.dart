import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glamii_app/src/presentation/screens/notifications_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
        backgroundColor: const Color(0xFF75140C),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture
              const TopArea(),
              const SizedBox(height: 16),
              const Text(
                'Emma Oliver',
                style: TextStyle(
                  fontFamily: 'GiazaStencil',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF75140C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'emmaoliver@example.com',
                style: TextStyle(
                  fontFamily: 'TTChocolates',
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
      
              // Profile Info Section
              Divider(thickness: 1, color: Colors.grey[300]),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF75140C)),
                title: const Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Emma Oliver',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Icon(Icons.edit, color: Color(0xFF75140C)),
                onTap: () {
                  // Navigate to Edit Profile Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF75140C)),
                title: const Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'emmaoliver@example.com',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFF75140C)),
                title: const Text(
                  'Phone',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '+1 (555) 123-4567',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Divider(thickness: 1, color: Colors.grey[300]),
      
              // Action Buttons
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF75140C)),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigate to Settings Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Color(0xFF75140C)),
                title: const Text(
                  'Privacy',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigate to Privacy Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  // Handle logout action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopArea extends StatelessWidget {
  const TopArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CircleAvatar(
          minRadius: 55,
          maxRadius: 65,
          backgroundColor: Color(0xFF75140C),
          child: CircleAvatar(
            minRadius: 50,
            maxRadius: 60,
            backgroundColor: Colors.grey,

            // backgroundImage: AssetImage(
            //     'assets/images/profile_placeholder.png'), // Replace with user image
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/9366572/pexels-photo-9366572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'), // Replace with user image
          ),
        ),
        Positioned(
            bottom: 8,
            right: 6,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xFF75140C),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
