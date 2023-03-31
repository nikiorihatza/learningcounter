import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/state_manager.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:pos_4ahif_learningcounter/Model/subjecthours.dart';

class SubjectHourWidget extends StatefulWidget {
  const SubjectHourWidget(this.subjectHours, this.subjectlist, {super.key});

  final SubjectHours subjectHours;
  final List<SubjectHours> subjectlist;

  @override
  State<StatefulWidget> createState() =>
      _SubjectHourWidgetState(subjectlist: subjectlist);
}

class _SubjectHourWidgetState extends State<SubjectHourWidget> {
  List<SubjectHours> subjectlist;

  _SubjectHourWidgetState({required this.subjectlist});

  void _delete(SubjectHours subjectHours) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "DELETE",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        setState(() {
          widget.subjectlist.remove(subjectHours);
          Navigator.of(context).pop();
        });
      },
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text(
        "Delete Subject",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text("Would you like to continue deleting the subject?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _increaseHours() {
    var increaseController = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Increase Hours'),
            content: Container(
              child: NumberInputWithIncrementDecrement(
                controller: increaseController,
                incIcon: CupertinoIcons.add,
                decIcon: CupertinoIcons.minus,
                incIconColor: Colors.blueGrey,
                decIconColor: Colors.blueGrey,
              ),
            ),
            actions: [
              TextButton(
                child: const Text(
                    'Ok',
                  style: TextStyle(
                    color: Colors.blueGrey
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.subjectHours.hours = widget.subjectHours.hours +
                        int.parse(increaseController.text);
                    widget.subjectHours.history.addAll({
                      DateTime.now() : int.parse(increaseController.text)
                    });
                  });
                  if (kDebugMode) {
                    print(widget.subjectHours.history);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _editSubject(SubjectHours subjectHours) {
    var subjectnameController = TextEditingController();
    subjectnameController.text = subjectHours.subject.name;
    var currentcolor = subjectHours.subject.colorSub;
    var newcolor = Colors.transparent;
    var changedColor = false;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit Subject'),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
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
                        label: const Text('Select color',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: Colors.white,
                        icon: Icon(
                          Icons.circle,
                          color: (changedColor)
                              ? newcolor
                              : subjectHours.subject.colorSub,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: MaterialPicker(
                                      pickerColor: currentcolor, //default color
                                      onColorChanged: (Color color) {
                                        //on color picked
                                        setState(() {
                                          currentcolor = color;
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
                                        changedColor = true;
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
                            widget.subjectHours.subject.name =
                                widget.subjectHours.subject.name = subjectnameController.text;  subjectnameController.text;
                            if (changedColor) {
                              widget.subjectHours.subject.colorSub = newcolor;
                            }
                          });
                          subjectnameController.clear();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          // fixedSize: Size(250, 50),
                        ),
                        child: const Text(
                          "Save",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(widget.subjectHours.subject.name),
      onLongPress: () {
        setState(() {
          _delete(widget.subjectHours);
        });
      },
      onTap: () {
        setState(() {
          _increaseHours();
        });
      },
      child: Card(
          elevation: 5,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  color: widget.subjectHours.subject.colorSub,
                ),
                title: Text(widget.subjectHours.subject.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(widget.subjectHours.hours.toString()),
                    IconButton(
                      hoverColor: Colors.black,
                      onPressed: () {
                        _editSubject(widget.subjectHours);
                      },
                      icon: const Icon(CupertinoIcons.pen, color: Colors.blueGrey),
                    )
                  ],
                ),
              ))),
    );
  }
}
