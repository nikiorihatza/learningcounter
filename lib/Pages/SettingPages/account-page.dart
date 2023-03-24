import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/AccountEditingPages/edit_description.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/AccountEditingPages/edit_email.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/AccountEditingPages/edit_image.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/AccountEditingPages/edit_name.dart';
import 'package:pos_4ahif_learningcounter/Pages/SettingPages/AccountEditingPages/edit_phone.dart';
import 'package:pos_4ahif_learningcounter/Widgets/display_image_widget.dart';

import '../../Data/user_data.dart';
import '../../Model/user.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey),
                )),
          ),
          InkWell(
            onTap: () {
              navigateSecondPage(const EditImagePage());
            },
            child: DisplayImage(
              imagePath: user.image,
              onPressed: () {},
            ),
          ),
          buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
          buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
          buildUserInfoDisplay(user.email, 'Email', const EditEmailFormPage()),
          Expanded(
            flex: 4,
            child: buildAbout(user),
          )
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 350,
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      navigateSecondPage(editPage);
                    },
                    child: Text(
                      getValue,
                      style: const TextStyle(
                          fontSize: 16, height: 1.4, color: Colors.blueGrey),
                    ),
                  )),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40,
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget buildAbout(User user) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell Us About Yourself',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      navigateSecondPage(EditDescriptionFormPage());
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(user.aboutMeDescription,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.4,
                              color: Colors.blueGrey,
                            )),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40,
                )
              ]),
            )
          ],
        ),
      );

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
