import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pos_4ahif_learningcounter/Model/subject.dart';
import 'package:pos_4ahif_learningcounter/Widgets/subjecthour_list.dart';

import '../Model/subjecthours.dart';

class CountHoursPage extends StatefulWidget {
  var subjectHoursData = <SubjectHours>[];

  CountHoursPage({super.key, required this.subjectHoursData});

  @override
  State<CountHoursPage> createState() {
    return _CountHoursPageState(subjectHoursData: subjectHoursData);
  }
}

class _CountHoursPageState extends State<CountHoursPage> {
  final subjectnameController = TextEditingController();

  var subjectHoursData = <SubjectHours>[];

  _CountHoursPageState({required this.subjectHoursData});

  Color newcolor = Colors.transparent;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    subjectnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add learned hours'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: SubjectHourList(subjecthoursList: subjectHoursData),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Text("Add new Subject"),
                onPressed: () {
                  setState(() {
                    _addSubject(context);
                  });
                }),
          )
        ]));
  }

  void _addSubject(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.0,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                top: 10.0,
              ),
              title: Text(
                "Add Subject",
                style: TextStyle(fontSize: 24.0),
              ),
              content: Container(
                height: 400,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Subject Name",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: subjectnameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter subject name here',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Color",
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton.extended(
                          label: Text('Select color',
                              style: TextStyle(color: Colors.black)),
                          backgroundColor: Colors.white,
                          icon: Icon(
                            Icons.circle,
                            color: newcolor,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Pick a color!'),
                                    content: SingleChildScrollView(
                                      child: MaterialPicker(
                                        pickerColor: newcolor, //default color
                                        onColorChanged: (Color color) {
                                          //on color picked
                                          setState(() {
                                            newcolor = color;
                                          });
                                        },
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueGrey),
                                        child: const Text('DONE'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); //dismiss the color picker
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              subjectHoursData.add(SubjectHours(
                                  subject: Subject(
                                      name: subjectnameController.text,
                                      colorSub: newcolor),
                                  hours: 0));
                            });
                            subjectnameController.clear();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                            // fixedSize: Size(250, 50),
                          ),
                          child: const Text(
                            "Add",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
