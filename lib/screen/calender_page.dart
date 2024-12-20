import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/app_colors.dart';

class CustomDatePicker extends StatefulWidget {
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          // Lavender Container wrapping the calendar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // White color for the calendar
                borderRadius: BorderRadius.all(Radius.circular(16)), // Rounded corners
              ),
              child: TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime(2025),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.orange, // Default selected color
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  headerMargin: EdgeInsets.zero, // Remove margin above the header
                  titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  headerPadding: EdgeInsets.symmetric(vertical: 4), // Reduce vertical padding
                ),
                // Set the start of the week to Monday
                startingDayOfWeek: StartingDayOfWeek.monday, // Start from Monday
              ),
            ),
          ),
        ],
      ),
    );
  }
}
