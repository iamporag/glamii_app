import 'package:flutter/material.dart';

class AppointmentDetailScreen extends StatelessWidget {
  final Map<String, String> appointment;

  const AppointmentDetailScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${appointment['service']} Details',
          style: const TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF75140C),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Name
            Text(
              'Service: ${appointment['service']}',
              style: const TextStyle(
                fontFamily: 'GiazaStencil',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF75140C),
              ),
            ),
            const SizedBox(height: 16),

            // Provider
            Text(
              'Provider: ${appointment['provider']}',
              style: const TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Date and Time
            Text(
              'Date: ${appointment['date']}',
              style: const TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              'Time: ${appointment['time']}',
              style: TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Status
            Text(
              'Status: ${appointment['status']}',
              style: TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 18,
                color: appointment['status'] == 'Upcoming'
                    ? Colors.green
                    : Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Button for rescheduling or marking as completed
            if (appointment['status'] == 'Upcoming') ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF75140C),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Add functionality to reschedule appointment
                },
                child: const Text(
                  'Reschedule Appointment',
                  style: TextStyle(
                    fontFamily: 'GiazaStencil',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ] else ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF75140C),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Add functionality to mark as completed (if needed)
                },
                child: const Text(
                  'Mark as Completed',
                  style: TextStyle(
                    fontFamily: 'GiazaStencil',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
