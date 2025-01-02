// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'appointment_detail_screen.dart';

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
      'date': '2024-11-15',
      'time': '2:00 PM',
      'status': 'Upcoming',
    },
    {
      'service': 'Massage',
      'provider': 'Sophia White',
      'date': '2024-11-15',
      'time': '5:00 PM',
      'status': 'Upcoming',
    },
    {
      'service': 'Facial Treatment',
      'provider': 'Anna Lee',
      'date': '2024-11-15',
      'time': '9:00 PM',
      'status': 'Upcoming',
    },
    {
      'service': 'Facial Treatment',
      'provider': 'Jane Smith',
      'date': '2024-11-14',
      'time': '11:00 AM',
      'status': 'Upcoming',
    },
    {
      'service': 'Massage',
      'provider': 'Anna Lee',
      'date': '2024-11-11',
      'time': '4:00 PM',
      'status': 'Completed',
    },
    {
      'service': 'Manicure',
      'provider': 'Sophia White',
      'date': '2024-11-10',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF75140C),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Calendar Widget
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
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
                  Text(
                    'Appointments on ${DateFormat('MMMM dd, yyyy').format(_selectedDay)}',
                    style: const TextStyle(
                      fontFamily: 'GiazaStencil',
                      fontSize: 20,
                      color: Color(0xFF75140C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: _getAppointmentsForDay(_selectedDay).isEmpty
                          ? [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'No appointments for this day',
                                  style: TextStyle(
                                    fontFamily: 'TTChocolates',
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ]
                          : _getAppointmentsForDay(_selectedDay)
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
                                  '${appointment['provider']} -  at ${appointment['time']}',
                                  style: TextStyle(
                                    fontFamily: 'TTChocolates',
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Navigate to Appointment Detail Page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentDetailScreen(
                                        appointment: appointment,
                                      ),
                                    ),
                                  );
                                },
                              );
                              // return Card(
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(12),
                              //   ),
                              //   child: ListTile(
                              //     title: Text(
                              //       appointment['service']!,
                              //       style: TextStyle(
                              //         fontFamily: 'TTChocolates',
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //     subtitle: Text(
                              //       appointment['time']!,
                              //       style: TextStyle(
                              //         fontFamily: 'TTChocolates',
                              //         fontSize: 14,
                              //         color: Colors.grey[600],
                              //       ),
                              //     ),
                              //     leading: GestureDetector(
                              //       onTap: (){

                              //       },
                              //       child: Icon(
                              //         Icons.calendar_today,
                              //         color: Color(0xFF75140C),
                              //       ),
                              //     ),
                              //   ),
                              // );
                            }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _selectedDay = DateTime.now();
//   DateTime _focusedDay = DateTime.now();

//   List<Map<String, dynamic>> appointments = [
//     {'date': '2024-11-08', 'time': '9:00 AM', 'service': 'Haircut', 'isPast': true},
//     {'date': '2024-11-08', 'time': '2:00 PM', 'service': 'Facial Treatment', 'isPast': true},
//     {'date': '2024-11-12', 'time': '10:00 AM', 'service': 'Haircut', 'isPast': false},
//     {'date': '2024-11-15', 'time': '2:00 PM', 'service': 'Massage', 'isPast': false},
//   ];

//   List<Map<String, dynamic>> _getPastAppointmentsForDay(DateTime day) {
//     String formattedDay = DateFormat('yyyy-MM-dd').format(day);
//     return appointments
//         .where((appointment) => appointment['date'] == formattedDay && appointment['isPast'])
//         .toList();
//   }

//   List<Map<String, dynamic>> _getUpcomingAppointmentsForDay(DateTime day) {
//     String formattedDay = DateFormat('yyyy-MM-dd').format(day);
//     return appointments
//         .where((appointment) => appointment['date'] == formattedDay && !appointment['isPast'])
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Calendar',
//           style: TextStyle(
//             fontFamily: 'GiazaStencil',
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Color(0xFF75140C),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Calendar Widget
//           TableCalendar(
//             firstDay: DateTime.utc(2023, 1, 1),
//             lastDay: DateTime.utc(2025, 12, 31),
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//             },
//             calendarStyle: CalendarStyle(
//               selectedDecoration: BoxDecoration(
//                 color: Color(0xFF75140C),
//                 shape: BoxShape.circle,
//               ),
//               todayDecoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             headerStyle: HeaderStyle(
//               titleCentered: true,
//               formatButtonVisible: false,
//               titleTextStyle: TextStyle(
//                 fontFamily: 'GiazaStencil',
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           // Appointment History for the Day
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Past Appointments',
//                     style: TextStyle(
//                       fontFamily: 'GiazaStencil',
//                       fontSize: 20,
//                       color: Color(0xFF75140C),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Expanded(
//                     child: ListView(
//                       children: _getPastAppointmentsForDay(_selectedDay).isEmpty
//                           ? [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'No past appointments for this day',
//                                   style: TextStyle(
//                                     fontFamily: 'TTChocolates',
//                                     fontSize: 16,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                             ]
//                           : _getPastAppointmentsForDay(_selectedDay).map((appointment) {
//                               return Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: ListTile(
//                                   title: Text(
//                                     appointment['service']!,
//                                     style: TextStyle(
//                                       fontFamily: 'TTChocolates',
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   subtitle: Text(
//                                     appointment['time']!,
//                                     style: TextStyle(
//                                       fontFamily: 'TTChocolates',
//                                       fontSize: 14,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                   leading: Icon(
//                                     Icons.history,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Upcoming Appointments',
//                     style: TextStyle(
//                       fontFamily: 'GiazaStencil',
//                       fontSize: 20,
//                       color: Color(0xFF75140C),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Expanded(
//                     child: ListView(
//                       children: _getUpcomingAppointmentsForDay(_selectedDay).isEmpty
//                           ? [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'No upcoming appointments for this day',
//                                   style: TextStyle(
//                                     fontFamily: 'TTChocolates',
//                                     fontSize: 16,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                             ]
//                           : _getUpcomingAppointmentsForDay(_selectedDay).map((appointment) {
//                               return Card(

//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: ListTile(
//                                   title: Text(
//                                     appointment['service']!,
//                                     style: TextStyle(
//                                       fontFamily: 'TTChocolates',
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   subtitle: Text(
//                                     appointment['time']!,
//                                     style: TextStyle(
//                                       fontFamily: 'TTChocolates',
//                                       fontSize: 14,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                   leading: Icon(
//                                     Icons.calendar_today,
//                                     color: Color(0xFF75140C),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'appointment_detail_screen.dart';

// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   late final ValueNotifier<List<Map<String, String>>> _selectedDayAppointments;
//   late DateTime _selectedDay;

//   // Dummy data for appointments
//   final Map<DateTime, List<Map<String, String>>> _appointments = {
//     DateTime(2024, 11, 10): [
//       {
//         'service': 'Haircut',
//         'provider': 'John Doe',
//         'time': '2:00 PM',
//       },
//     ],
//     DateTime(2024, 11, 12): [
//       {
//         'service': 'Facial Treatment',
//         'provider': 'Jane Smith',
//         'time': '11:00 AM',
//       },
//     ],
//     DateTime(2024, 11, 15): [
//       {
//         'service': 'Massage',
//         'provider': 'Anna Lee',
//         'time': '3:00 PM',
//       },
//     ],
//   };

//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = DateTime.now();
//     _selectedDayAppointments = ValueNotifier(_appointments[_selectedDay] ?? []);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Calendar',
//           style: TextStyle(
//             fontFamily: 'GiazaStencil',
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Color(0xFF75140C),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Calendar Widget
//             TableCalendar(
//               firstDay: DateTime.utc(2020, 1, 1),
//               lastDay: DateTime.utc(2030, 12, 31),
//               focusedDay: _selectedDay,
//               selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _selectedDayAppointments.value = _appointments[selectedDay] ?? [];
//                 });
//               },
//             ),

//             SizedBox(height: 20),

//             // Display appointments for selected day
//             ValueListenableBuilder<List<Map<String, String>>>(
//               valueListenable: _selectedDayAppointments,
//               builder: (context, appointments, _) {
//                 if (appointments.isEmpty) {
//                   return Center(
//                     child: Text(
//                       'No appointments for this day.',
//                       style: TextStyle(
//                         fontFamily: 'TTChocolates',
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   );
//                 }

//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: appointments.length,
//                     itemBuilder: (context, index) {
//                       final appointment = appointments[index];

//                       return ListTile(
//                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                         title: Text(
//                           appointment['service']!,
//                           style: TextStyle(
//                             fontFamily: 'GiazaStencil',
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           '${appointment['provider']} - ${appointment['time']}',
//                           style: TextStyle(
//                             fontFamily: 'TTChocolates',
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                         trailing: Icon(Icons.arrow_forward_ios),
//                         onTap: () {
//                           // Navigate to appointment detail screen
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AppointmentDetailScreen(
//                                 appointment: appointment,
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// use top Calendar for this ///

// ignore_for_file: unused_element

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// import 'appointment_detail_screen.dart';
// import 'package:intl/intl.dart';

// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({super.key});

//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   DateTime _selectedDay = DateTime.now();

//   DateTime _focusedDay = DateTime.now();

//   // Dummy data for appointments
//   final List<Map<String, String>> upcomingAppointments = [
//     {
//       'service': 'Haircut',
//       'provider': 'John Doe',
//       'date': '2024-11-10',
//       'time': '2:00 PM',
//       'status': 'Upcoming',
//     },
//     {
//       'service': 'Facial Treatment',
//       'provider': 'Jane Smith',
//       'date': '2024-11-12',
//       'time': '11:00 AM',
//       'status': 'Upcoming',
//     },
//   ];

//   final List<Map<String, String>> pastAppointments = [
//     {
//       'service': 'Massage',
//       'provider': 'Anna Lee',
//       'date': '2024-10-25',
//       'time': '4:00 PM',
//       'status': 'Completed',
//     },
//     {
//       'service': 'Manicure',
//       'provider': 'Sophia White',
//       'date': '2024-10-20',
//       'time': '1:00 PM',
//       'status': 'Completed',
//     },
//   ];

//   //   List<Map<String, String>> appointments = [
//   //   {'date': '2024-11-12', 'time': '10:00 AM', 'service': 'Haircut'},
//   //   {'date': '2024-11-15', 'time': '2:00 PM', 'service': 'Facial Treatment'},
//   // ];

//   List<Map<String, String>> _getAppointmentsForDay(DateTime day) {
//     String formattedDay = DateFormat('yyyy-MM-dd').format(day);
//     return upcomingAppointments
//         .where((appointment) => appointment['date'] == formattedDay)
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Appointments',
//           style: TextStyle(
//             fontFamily: 'GiazaStencil',
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFF75140C),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TableCalendar(
//                 firstDay: DateTime.utc(2023, 1, 1),
//                 lastDay: DateTime.utc(2025, 12, 31),
//                 focusedDay: _focusedDay,
//                 selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                 onDaySelected: (selectedDay, focusedDay) {
//                   setState(() {
//                     _selectedDay = selectedDay;
//                     _focusedDay = focusedDay;
//                   });
//                 },
//                 calendarStyle: CalendarStyle(
//                   todayTextStyle: const TextStyle(fontFamily: "TTChocolates"),
//                   selectedTextStyle: const TextStyle(
//                       fontFamily: "TTChocolates",
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                   weekendTextStyle: const TextStyle(
//                       fontFamily: "TTChocolates", fontWeight: FontWeight.bold),
//                   holidayTextStyle: const TextStyle(
//                       fontFamily: "TTChocolates", fontWeight: FontWeight.bold),
//                   defaultTextStyle: const TextStyle(fontFamily: "TTChocolates"),
//                   selectedDecoration: const BoxDecoration(
//                     color: Color(0xFF75140C),
//                     shape: BoxShape.circle,
//                   ),
//                   todayDecoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 headerStyle: const HeaderStyle(
//                   titleCentered: true,
//                   formatButtonVisible: false,
//                   titleTextStyle: TextStyle(
//                     fontFamily: 'GiazaStencil',
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               // Upcoming Appointments
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 'Upcoming Appointments',
//                 style: TextStyle(
//                   fontFamily: 'GiazaStencil',
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF75140C),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: upcomingAppointments.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 16),
//                     title: Text(
//                       upcomingAppointments[index]['service']!,
//                       style: const TextStyle(
//                         fontFamily: 'GiazaStencil',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       '${upcomingAppointments[index]['provider']} - ${upcomingAppointments[index]['date']} at ${upcomingAppointments[index]['time']}',
//                       style: TextStyle(
//                         fontFamily: 'TTChocolates',
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                     onTap: () {
//                       // Navigate to Appointment Detail Page
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AppointmentDetailScreen(
//                             appointment: upcomingAppointments[index],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),

//               const SizedBox(height: 32),

//               // Past Appointments
//               const Text(
//                 'Past Appointments',
//                 style: TextStyle(
//                   fontFamily: 'GiazaStencil',
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF75140C),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: pastAppointments.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 16),
//                     title: Text(
//                       pastAppointments[index]['service']!,
//                       style: const TextStyle(
//                         fontFamily: 'GiazaStencil',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       '${pastAppointments[index]['provider']} - ${pastAppointments[index]['date']} at ${pastAppointments[index]['time']}',
//                       style: TextStyle(
//                         fontFamily: 'TTChocolates',
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                     onTap: () {
//                       // Navigate to Appointment Detail Page
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AppointmentDetailScreen(
//                             appointment: pastAppointments[index],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),

//               Text(
//                 'Appointments on ${DateFormat('MMMM dd, yyyy').format(_selectedDay)}',
//                 style: TextStyle(
//                   fontFamily: 'GiazaStencil',
//                   fontSize: 20,
//                   color: Color(0xFF75140C),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
