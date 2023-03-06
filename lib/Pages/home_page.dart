import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Data/menu_items.dart';
import 'package:pos_4ahif_learningcounter/Model/menu_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: PopupMenuButton<MenuItem>(
              icon: const Icon(
                Icons.home,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              itemBuilder: (context) => [
                ...MenuItems.items.map(buildItem).toList(),
              ],
            ),
            title: const Text('LearnTrack - Home'),
            titleTextStyle: const TextStyle(color: Colors.white),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.black,))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              //color: const Color.fromRGBO(76, 175, 80, 90),
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
}
