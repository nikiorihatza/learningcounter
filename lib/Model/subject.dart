import 'package:flutter/cupertino.dart';

class Subject {
  String name;
  Color colorSub;

  Subject({
    required this.name,
    required this.colorSub,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subject &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
