// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontFamily: 'GiazaStencil',
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF75140C),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.notifications_active_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  'Appointments on ${DateFormat('MMMM dd, yyyy').format(_selectedDay)}',
                  style: const TextStyle(
                    fontFamily: 'GiazaStencil',
                    fontSize: 20,
                    color: Color(0xFF75140C),
                  ),
                ),
                subtitle: const Text(
                  "Hair Cut  -  2024-11-12  -  at - 2.00 PM",
                  style: TextStyle(
                      fontFamily: "TTChocolates", color: Color(0xFF75140C)),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.notifications_active_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  'Your Appointments is Confirmed',
                  style: TextStyle(
                    fontFamily: 'GiazaStencil',
                    fontSize: 20,
                    color: Color(0xFF75140C),
                  ),
                ),
                subtitle: Text(
                  "Hair Cut  -  2024-11-15  -  at - 2.00 PM",
                  style: TextStyle(
                    fontFamily: "TTChocolates",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.red),
                title: const Text(
                  "Redeemed Points",
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  '2024-10-20 - For Booking Hair Cut Service',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Text(
                  "+200",
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.green),
                title: const Text(
                  "Earned Points",
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  '2024-10-20 - For referring a friend',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Text(
                  "+200",
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.grey),
                title: const Text(
                  "Expired Points",
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  '2024-10-05 - Expired',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Text(
                  "+200",
                  style: const TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
