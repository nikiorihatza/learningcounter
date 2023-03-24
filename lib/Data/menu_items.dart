import 'package:pos_4ahif_learningcounter/Model/menu_item.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static const List<MenuItem> itemsMenu = [itemHome, itemCount, itemGraphs];

  static const List<MenuItem> itemsSettings = [
    itemAccount,
    itemAppearance,
    itemSignOut
  ];

  static const itemHome = MenuItem(
    text: 'Home',
    icon: Icons.home,
  );

  static const itemCount = MenuItem(
    text: 'Count hours',
    icon: Icons.add,
  );

  static const itemGraphs = MenuItem(
    text: 'Graphs',
    icon: Icons.bar_chart_outlined,
  );

  static const itemAccount = MenuItem(
    text: 'Account',
    icon: Icons.person,
  );

  static const itemAppearance = MenuItem(
    text: 'Appearance',
    icon: Icons.color_lens,
  );

  static const itemSignOut = MenuItem(
    text: 'Sign Out',
    icon: Icons.logout,
  );
}
