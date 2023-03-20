import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Model/subjecthours.dart';

class SubjectHourWidget extends StatefulWidget {
  SubjectHourWidget(this.subjectHours, {super.key});
  
  final SubjectHours subjectHours;
  
  @override
  State<StatefulWidget> createState() => _SubjectHourWidgetState();
}

class _SubjectHourWidgetState extends State<SubjectHourWidget>{
  void _increaseHours() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('You clicked on'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text('This is a Dialog Box. Click OK to Close.'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(widget.subjectHours.subject.name),
      onTap: () {
        setState(() {
          _increaseHours();
        });
      },
      child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.circle,
                color: widget.subjectHours.subject.colorSub,
              ),
            ),
            SizedBox(width: 16),
            Text(widget.subjectHours.subject.name),
            Text(widget.subjectHours.hours as String, textAlign: TextAlign.right,)
          ],
        ),
      )
    ),
    );
  }
  
}