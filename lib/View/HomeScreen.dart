import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

final sampleEvents = {
  DateTime.utc(2022, 10, 3): ['firstEvent', 'secondEvent'],
  DateTime.utc(2022, 10, 5): ['thirdEvent', 'fourthEvent']
};

class TableCalendarEventSelection extends StatefulWidget {
  const TableCalendarEventSelection({Key? key}) : super(key: key);

  @override
  State<TableCalendarEventSelection> createState() =>
      _TableCalendarEventSelectionState();
}

class _TableCalendarEventSelectionState
    extends State<TableCalendarEventSelection> {
  DateTime _focusedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;

  List<String> _selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('ホーム'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableCalendar(
              headerVisible: true,
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1),
              locale: 'ja_JP',
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents = sampleEvents[selectedDay] ?? [];
                });
              },
              eventLoader: (date) {
                return sampleEvents[date] ?? [];
              },
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
                //leftChevronVisible: false,
                // rightChevronVisible: false,
                headerPadding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                final event = _selectedEvents[index];
                return Card(
                  child: ListTile(
                    title: Text(event),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
