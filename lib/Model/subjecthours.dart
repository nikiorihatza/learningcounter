import 'package:pos_4ahif_learningcounter/Model/subject.dart';

class SubjectHours {
  Subject subject;
  int hours;
  late Map<DateTime, int> history = {};

  SubjectHours({
    required this.subject,
    required this.hours,
  });
}
