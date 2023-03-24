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
    late TooltipBehavior _tooltip = TooltipBehavior(enable: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphs'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  'Circlular Chart',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<SubjectHours, String>(
                    dataSource: subjectHoursData,
                    xValueMapper: (SubjectHours data, _) => data.subject.name,
                    yValueMapper: (SubjectHours data, _) => data.hours,
                    pointColorMapper: (SubjectHours data, _) =>
                        data.subject.colorSub)
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 8),
              child: Center(
                child: Text(
                  'Bar Chart',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: 40, interval: 10),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<SubjectHours, String>>[
                  BarSeries<SubjectHours, String>(
                      dataSource: subjectHoursData,
                      xValueMapper: (SubjectHours data, _) => data.subject.name,
                      yValueMapper: (SubjectHours data, _) => data.hours,
                      pointColorMapper: (SubjectHours data, _) =>
                          data.subject.colorSub)
                ]),
          ],
        ),
      ),
    );
  }
}
