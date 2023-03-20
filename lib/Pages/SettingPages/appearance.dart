import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appearance'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: const [
              Icon(CupertinoIcons.time),
              Text("Coming soon!")
            ],
          ),
        ),
      ),
    );
  }
}
