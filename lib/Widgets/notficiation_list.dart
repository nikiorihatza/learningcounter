import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_learningcounter/Widgets/notification_widget.dart';

import '../Model/notification.dart';

class NotificationList extends StatelessWidget {
  final List<LearnNotification> notifications = <LearnNotification>[
    LearnNotification(
        notificationID: 1,
        shortDesc: 'Mehr Lernen',
        description: 'Du wirst eingeladen zum Lernen'),
    LearnNotification(
        notificationID: 2,
        shortDesc: 'GGP wartet',
        description: 'Du hast seit Langem nichts mehr für GGP gelernt'),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: notifications.isEmpty
              ? const Center(child: Text('Nothing new here'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: notifications.length,
                  itemBuilder: (_, index) => NotificationWidget(
                        learnNotification: notifications[index],
                      ))),
    );
  }
}
