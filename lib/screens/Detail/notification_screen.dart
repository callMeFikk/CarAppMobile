import 'package:flutter/material.dart';

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  _NotificationPreferencesScreenState createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends State<NotificationPreferencesScreen> {
  bool messageNotifications = true;
  bool updateNotifications = true;
  bool promotionalNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Preferences'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Message Notifications'),
            subtitle: const Text('Receive notifications for new messages'),
            value: messageNotifications,
            onChanged: (bool value) {
              setState(() {
                messageNotifications = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Update Notifications'),
            subtitle: const Text('Receive notifications for updates and news'),
            value: updateNotifications,
            onChanged: (bool value) {
              setState(() {
                updateNotifications = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Promotional Notifications'),
            subtitle: const Text('Receive notifications for promotions and offers'),
            value: promotionalNotifications,
            onChanged: (bool value) {
              setState(() {
                promotionalNotifications = value;
              });
            },
          ),
        ],
      ),
    );
  }
}