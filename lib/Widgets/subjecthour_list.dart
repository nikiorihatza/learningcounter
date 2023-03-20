import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_learningcounter/Model/subject.dart';
import 'package:pos_4ahif_learningcounter/Widgets/subjectHour_widget.dart';

import '../Model/subjecthours.dart';

class SubjectHourList extends StatelessWidget {
  final List<SubjectHours> subjecthoursList;

  SubjectHourList({
    super.key,
    required this.subjecthoursList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: subjecthoursList.isEmpty
            ? const Center(child: Text('Nothing learned yet :('))
            : ListView.builder(
            shrinkWrap: true,
            itemCount: subjecthoursList.length,
            itemBuilder: (_, index) =>
                SubjectHourWidget(subjecthoursList[index])));
  }
}