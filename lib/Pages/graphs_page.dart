import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_learningcounter/Widgets/subjecthour_list.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import '../Model/subjecthours.dart';

class GraphPage extends StatelessWidget {
  var subjectHoursData = <SubjectHours>[];
  GraphPage({super.key, required this.subjectHoursData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphs'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<SubjectHours, String>(
                dataSource: subjectHoursData,
                xValueMapper: (SubjectHours data, _) => data.subject.name,
                yValueMapper: (SubjectHours data, _) => data.hours,
                pointColorMapper: (SubjectHours data, _) => data.subject.colorSub
              )
            ],
          ),
        ),
      )
    );
  }

}