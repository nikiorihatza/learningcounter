import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Model/subject.dart';
import '../Model/subjecthours.dart';

class HistoryPage extends StatefulWidget {

  HistoryPage({super.key, required List<SubjectHours> subjectHoursData});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var subjectHoursData = <SubjectHours>[];

  var _focusedDay = DateTime.now();
  var _selectedDay;
  var _selectedSubjects;
  var _rangeStart = null; // Important to clean those
  var _rangeEnd = null;
  var _calendarFormat = CalendarFormat.month;
  var _rangeSelectionMode = RangeSelectionMode.toggledOff;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedSubjects = ValueNotifier(_getLearnedSubjectForDay(_selectedDay));
  }

  List<Subject> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getLearnedSubjectForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedSubjects.value = _getLearnedSubjectForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedSubjects.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedSubjects.value = _getLearnedSubjectForDay(start);
    } else if (end != null) {
      _selectedSubjects.value = _getLearnedSubjectForDay(end);
    }
  }

  List<Subject> _getLearnedSubjectForDay(DateTime day) {
    List<Subject> learnedSubject = [];

    for (SubjectHours subjectHours in subjectHoursData) {
      var history = subjectHours.history;

      if (history.containsKey(day)) {
        learnedSubject.add(subjectHours.subject);
      }
    }

    return learnedSubject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar<Subject>(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2016, 1, 1),
            lastDay: DateTime.utc(2040, 31, 12),
            rangeSelectionMode: RangeSelectionMode.toggledOff,
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: (day) {
              return _getLearnedSubjectForDay(day);
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Subject>>(
              valueListenable: _selectedSubjects,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        leading: Icon(
                          CupertinoIcons.circle_fill,
                          color: value[index].colorSub,
                        ),
                        title: Text(value[index].name),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )
      );
  }

  daysInRange(DateTime start, DateTime end) {

  }
}

