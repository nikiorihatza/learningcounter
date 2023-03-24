import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/account-page.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/appearance.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/signout-page.dart';
import 'package:pos_4ahif_learningcounter/Pages/home_page.dart';

import '../Data/menu_items.dart';
import '../Model/menu_item.dart';

class SettingsPage extends StatelessWidget {
  final List<MenuItem> settingItems = MenuItems.itemsSettings;

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: CupertinoListSection.insetGrouped(
          children: <CupertinoListTile>[
            CupertinoListTile.notched(
              title: Text('Account'),
              leading: Icon(CupertinoIcons.person),
              trailing: CupertinoListTileChevron(),
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const AccountPage())),
            ),
            CupertinoListTile.notched(
              title: Text('Appearance'),
              leading: Icon(Icons.color_lens_outlined),
              trailing: CupertinoListTileChevron(),
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const AppearancePage())),
            ),
            const CupertinoListTile.notched(
              title: Text('Sign out'),
              leading: Icon(Icons.logout),
              onTap: null,
            ),
          ],
        ));
  }
}
