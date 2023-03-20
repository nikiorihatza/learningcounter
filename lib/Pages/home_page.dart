import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Data/menu_items.dart';
import 'package:pos_4ahif_learningcounter/Model/menu_item.dart';
import 'package:pos_4ahif_learningcounter/Pages/counthours_page.dart';
import 'package:pos_4ahif_learningcounter/Pages/graphs_page.dart';
import 'package:pos_4ahif_learningcounter/Pages/settings_page.dart';
import 'package:pos_4ahif_learningcounter/Widgets/notficiation_list.dart';
import 'package:pos_4ahif_learningcounter/Widgets/notification_widget.dart';

import '../Model/subjecthours.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.subjectHoursData});

  var subjectHoursData = <SubjectHours>[];

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(subjectHoursData: subjectHoursData);
}

class _MyHomePageState extends State<MyHomePage> {
  var subjectHoursData = <SubjectHours>[];

  _MyHomePageState({required this.subjectHoursData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            leading: PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              icon: const Icon(Icons.home, color: Colors.black),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              itemBuilder: (context) => [
                ...MenuItems.itemsMenu.map(buildItem).toList(),
              ],
            ),
            title: const Text('LearnTrack - Home'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage()));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(150, 183, 204, 150),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: <Widget>[
                  Container(
                      width: 350,
                      padding: EdgeInsets.all(8),
                      child: const Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5)),
                    child: NotificationList(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text)
          ],
        ),
      );

  onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemHome:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MyHomePage(subjectHoursData: subjectHoursData)));
        break;
      case MenuItems.itemCount:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CountHoursPage(subjectHoursData: subjectHoursData)));
        break;
      case MenuItems.itemGraphs:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                GraphPage(subjectHoursData: subjectHoursData)));
    }
  }
}
