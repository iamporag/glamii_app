import 'package:flutter/material.dart';
import 'package:glamii_app/util/styles.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../util/dimensions.dart';
import '../../base/custom_app_bar.dart';
import '../appointment/appointment_detail_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<Map<String, String>> appointments = [
    {
      'service': 'Haircut',
      'provider': 'John Park',
      'date': '2025-10-09',
      'time': '2:00 PM',
      'status': 'Upcoming',
    },
    {
      'service': 'Massage',
      'provider': 'Sophia White',
      'date': '2025-10-09',
      'time': '5:00 PM',
      'status': 'Upcoming',
    },
    {
      'service': 'Facial Treatment',
      'provider': 'Anna Lee',
      'date': '2025-10-09',
      'time': '9:00 PM',
      'status': 'Upcoming',
    },
    {
      'service': 'Facial Treatment',
      'provider': 'Jane Smith',
      'date': '2025-10-09',
      'time': '11:00 AM',
      'status': 'Upcoming',
    },
    {
      'service': 'Massage',
      'provider': 'Anna Lee',
      'date': '2025-10-09',
      'time': '4:00 PM',
      'status': 'Completed',
    },
    {
      'service': 'Manicure',
      'provider': 'Sophia White',
      'date': '2025-10-09',
      'time': '1:00 PM',
      'status': 'Completed',
    },
  ];

  List<Map<String, String>> _getAppointmentsForDay(DateTime day) {
    String formattedDay = DateFormat('yyyy-MM-dd').format(day);
    return appointments
        .where((appointment) => appointment['date'] == formattedDay)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Calendar',
        isBackButtonExist: false,
      ),
      body: Column(
        children: [
          // Calendar Widget
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            calendarFormat: CalendarFormat.week,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: Color(0xFF75140C),
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontFamily: 'GiazaStencil',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Upcoming Appointments
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Appointments on ${DateFormat('MMMM').format(_selectedDay)}',
                        style: giazaStencilMedium.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: theme.primaryColor,
                        ),
                      ),
                      Text(' ${DateFormat('dd, yyyy').format(_selectedDay)}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                          )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _getAppointmentsForDay(_selectedDay).isEmpty
                        ? const Center(
                            child: Text(
                              'No appointments for this day',
                              style: TextStyle(
                                fontFamily: 'TTChocolates',
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ListView(
                            children: _getAppointmentsForDay(_selectedDay)
                                .map((appointment) {
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                title: Text(
                                  appointment['service']!,
                                  style: const TextStyle(
                                    fontFamily: 'GiazaStencil',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '${appointment['provider']} - at ${appointment['time']}',
                                  style: TextStyle(
                                    fontFamily: 'TTChocolates',
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentDetailScreen(
                                              appointment: appointment),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
