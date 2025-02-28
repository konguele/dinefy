import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart'; // Importar DateFormat

class CalendarWidget extends StatelessWidget {
  final Map<DateTime, List<Transaction>> groupedTransactions;
  final Function(DateTime) onDaySelected;

  CalendarWidget({
    required this.groupedTransactions,
    required this.onDaySelected,
  });

  List<Widget> _buildEventMarkers(List<dynamic> events) {
    bool hasIncome = events.any((event) => event.amount > 0);
    bool hasExpense = events.any((event) => event.amount < 0);

    List<Widget> markers = [];

    if (hasIncome) {
      markers.add(
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
      );
    }

    if (hasExpense) {
      markers.add(
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
      );
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.week: 'Semana',
      },
      locale: Localizations.localeOf(context).toString(), // Usar el idioma del dispositivo
      headerStyle: HeaderStyle(
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMM(locale).format(date), // Formato del mes en el idioma del dispositivo
        formatButtonVisible: false,
        titleCentered: true,
      ),
      eventLoader: (day) {
        DateTime normalizedDate = DateTime(day.year, day.month, day.day);
        return groupedTransactions[normalizedDate] ?? [];
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          return events.isNotEmpty
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: _buildEventMarkers(events),
                  ),
                )
              : SizedBox.shrink();
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        onDaySelected(selectedDay);
      },
    );
  }
}