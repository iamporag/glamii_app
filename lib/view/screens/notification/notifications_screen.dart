// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:glamii_app/util/dimensions.dart';
import 'package:glamii_app/util/styles.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  style: giazaStencilRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                subtitle: Text(
                  "Hair Cut  -  2024-11-12  -  at - 2.00 PM",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications_active_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  'Your Appointments is Confirmed',
                  style: giazaStencilRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                subtitle: Text(
                  "Hair Cut  -  2024-11-15  -  at - 2.00 PM",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.red),
                title: Text(
                  "Redeemed Points",
                  style: giazaStencilRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                subtitle: Text(
                  '2024-10-20 - For Booking Hair Cut Service',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
                trailing: Text(
                  "+200",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.green),
                title: Text(
                  "Earned Points",
                  style: giazaStencilRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                subtitle: Text(
                  '2024-10-20 - For referring a friend',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
                trailing: Text(
                  "+200",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Colors.grey),
                title: Text(
                  "Expired Points",
                  style: giazaStencilRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  ),
                ),
                subtitle: Text(
                  '2024-10-05 - Expired',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
                trailing: Text(
                  "-200",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: "TTChocolates",
                    color: const Color(0xFF75140C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
