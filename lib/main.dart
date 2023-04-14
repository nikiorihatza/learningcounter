import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Model/subjecthours.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(const LearningcounterApp());
}

class LearningcounterApp extends StatelessWidget {
  const LearningcounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    var subjectHoursData = <SubjectHours>[];
    bool loggedin = true;
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(150, 183, 204, 100),
      )),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(subjectHoursData: subjectHoursData),
    );
  }
}
