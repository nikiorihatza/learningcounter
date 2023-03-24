import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Model/notification.dart';

class NotificationWidget extends StatefulWidget {
  final LearnNotification learnNotification;

  const NotificationWidget({super.key, required this.learnNotification});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.warning,
                size: 50,
                color: Colors.red,
              ),
              title: Text(
                widget.learnNotification.shortDesc,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.learnNotification.description),
            )
          ],
        ));
  }
}
