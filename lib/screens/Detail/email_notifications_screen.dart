import 'package:flutter/material.dart';
class EmailNotificationsScreen extends StatefulWidget {
  const EmailNotificationsScreen({super.key});

  @override
  _EmailNotificationsScreenState createState() =>
      _EmailNotificationsScreenState();
}

class _EmailNotificationsScreenState extends State<EmailNotificationsScreen> {
  bool newsNotifications = true;
  bool productUpdates = true;
  bool promotionalEmails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Notifications'),
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
            title: const Text('News Notifications'),
            subtitle: const Text('Receive email notifications for news'),
            value: newsNotifications,
            onChanged: (bool value) {
              setState(() {
                newsNotifications = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Product Updates'),
            subtitle: const Text('Receive email notifications for product updates'),
            value: productUpdates,
            onChanged: (bool value) {
              setState(() {
                productUpdates = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Promotional Emails'),
            subtitle: const Text('Receive email notifications for promotions and offers'),
            value: promotionalEmails,
            onChanged: (bool value) {
              setState(() {
                promotionalEmails = value;
              });
            },
          ),
        ],
      ),
    );
  }
}