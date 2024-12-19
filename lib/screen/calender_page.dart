import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart'; // For responsive sizing

// Assuming AppColors is defined elsewhere in your code
// Example:
// AppColors.blue = Colors.blue;
// AppColors.lavender = Colors.lavender;
// AppColors.white = Colors.white;

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  var containerColorProvider;
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now().add(const Duration(days: 1)),
  ];

  final config = CalendarDatePicker2Config(
    calendarViewMode: CalendarDatePicker2Mode.scroll,
    selectedDayHighlightColor: Colors.blue,
   // weekdayLabels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
    weekdayLabelTextStyle: TextStyle(
      color: Colors.black, // White text for weekday labels
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    firstDayOfWeek: 1, // Starting from Monday
    controlsHeight: 50,
    dayMaxWidth: 25,
    controlsTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: const TextStyle(

      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
    disabledDayTextStyle: const TextStyle(
      color: Colors.grey,
    ),
    modePickersGap: 0,
    modePickerTextHandler: ({required monthDate, isMonthPicker}) {
      if (isMonthPicker ?? false) {
        return '${getLocaleShortMonthFormat(const Locale('en')).format(monthDate)} C';
      }
      return null;
    },
    firstDate: DateTime(DateTime.now().year - 2, DateTime.now().month - 1,
        DateTime.now().day - 5),
    lastDate: DateTime(DateTime.now().year + 3, DateTime.now().month + 2,
        DateTime.now().day + 10),
    selectableDayPredicate: (day) =>
    !day
        .difference(DateTime.now().add(const Duration(days: 3)))
        .isNegative &&
        day.isBefore(DateTime.now().add(const Duration(days: 30))),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 407.w, // Responsive width
          height: 260.h, // Responsive height
          color: AppColors.lavender, // Outer container with lavender background
          child: Padding(
            padding: EdgeInsets.all(10.w), // Padding for inner container
            child: Container(
              width: 299.w,
              height: 165.h,
              decoration: BoxDecoration(
              //  color: Colors.blue, // Set the background color
                color: Colors.white, // White background for the calendar container
                borderRadius: BorderRadius.circular(20), // Set the rounded corners
              ),

              child: CalendarDatePicker2(
                displayedMonthDate:
                _singleDatePickerValueWithDefaultValue.first,
                config: config,
                value: _singleDatePickerValueWithDefaultValue,
                onValueChanged: (dates) => setState(() {
                  _singleDatePickerValueWithDefaultValue = dates;
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
