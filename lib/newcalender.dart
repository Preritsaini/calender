import 'package:flutter/material.dart';
import 'dart:core';

class DateCal extends StatefulWidget {
  const DateCal({super.key});

  @override
  State<DateCal> createState() => _DateCalState();
}

class _DateCalState extends State<DateCal> {
  DateTime today = DateTime.now();
  DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  DateTime nextWeek = DateTime.now().add(Duration(days: 7));

  List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  int year = DateTime.now().year;
  int monthIndex = DateTime.now().month - 1;
  int selectedIndex = 0;

  CustomDateLogic dateLogic = CustomDateLogic();

  void monthInc() {
    if (monthIndex >= 11) {
      monthIndex = 0;
      year++;
    } else {
      monthIndex++;
    }
    setState(() {});
  }

  void monthDec() {
    if (monthIndex <= 0) {
      monthIndex = 11;
      year--;
    } else {
      monthIndex--;
    }
    setState(() {});
  }

  String formatDate(DateTime date) {
    return "${days[date.weekday % 7]}, ${months[date.month - 1]} ${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    List<int> daysInMonth = dateLogic.getDaysForMonth(monthIndex, year);
    DateTime firstDayOfMonth = DateTime(year, monthIndex + 1, 1);
    int startDay = firstDayOfMonth.weekday % 7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.withOpacity(0.8),
        title: const Text(
          "Calendar",
          style: TextStyle(fontSize: 30,color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildMonthNavigation(),
              const SizedBox(height: 16),
              _buildWeekdaysHeader(),
              const SizedBox(height: 10),
              _buildCalendarGrid(daysInMonth, startDay),
              const SizedBox(height: 20),
              _buildSelectedDateText(),
              const Divider(thickness: 1),
              const SizedBox(height: 8),
              _buildDateTiles(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: monthDec,
            icon: Icon(Icons.navigate_before, size: 36, color: Colors.indigo),
          ),
          Text(
            "${months[monthIndex]} $year",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.indigo,
            ),
          ),
          IconButton(
            onPressed: monthInc,
            icon: Icon(Icons.navigate_next, size: 36, color: Colors.indigo),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdaysHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        return Text(
          day,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid(List<int> daysInMonth, int startDay) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        padding: const EdgeInsets.all(8.0),
        children: [
          ...List.generate(startDay, (index) => const SizedBox.shrink()), // Empty cells
          ...daysInMonth.map((day) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = day;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == day
                      ? Colors.blueAccent.withOpacity(0.7)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedIndex == day
                        ? Colors.blueAccent.withOpacity(0.7)
                        : Colors.grey.shade300,
                  ),
                  boxShadow: selectedIndex == day
                      ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 5)]
                      : [],
                ),
                margin: const EdgeInsets.all(6),
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == day ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSelectedDateText() {
    return Text(
      'Selected Date: $selectedIndex ${months[monthIndex]} $year',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.indigo),
    );
  }

  Widget _buildDateTiles() {
    return Column(
      children: [
        _buildListTile("Today", formatDate(today)),
        _buildListTile("Tomorrow", formatDate(tomorrow)),
        _buildListTile("Next Week", formatDate(nextWeek)),
      ],
    );
  }

  Widget _buildListTile(String title, String trailingText) {
    return ListTile(
      leading: const Icon(Icons.calendar_today, size: 26, color: Colors.indigo),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      trailing: Text(trailingText, style: const TextStyle(fontSize: 16, color: Colors.black54)),
    );
  }
}

class CustomDateLogic {
  List<int> daysInEachMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  List<int> getDaysForMonth(int monthIndex, int year) {
    int days = daysInEachMonth[monthIndex];
    if (monthIndex == 1 && isLeapYear(year)) {
      days = 29;
    }
    return List.generate(days, (index) => index + 1);
  }
}
