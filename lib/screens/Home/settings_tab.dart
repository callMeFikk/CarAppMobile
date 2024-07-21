import 'package:final_mobile/Pages/logout.dart';
import 'package:final_mobile/screens/Detail/Account.dart';
import 'package:final_mobile/screens/Detail/about_screen.dart';
import 'package:final_mobile/screens/Detail/email_notifications_screen.dart';
import 'package:final_mobile/screens/Detail/language_screen.dart';
import 'package:final_mobile/screens/Detail/notification_screen.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SettingsCategory(
            title: 'Account',
            settings: [
              SettingsItem(
                icon: Icons.person,
                title: 'Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()),
                  );
                },
              ),
              SettingsItem(
                icon: Icons.lock,
                title: 'Change Password',
                onTap: () {
                  
                },
              ),
            ],
          ),
          SettingsCategory(
            title: 'Notifications',
            settings: [
              SettingsItem(
                icon: Icons.notifications,
                title: 'Notification Preferences',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NotificationPreferencesScreen()),
                  );
                },
              ),
              SettingsItem(
                icon: Icons.email,
                title: 'Email Notifications',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailNotificationsScreen()),
                  );
                },
              ),
            ],
          ),
          SettingsCategory(
            title: 'General',
            settings: [
              SettingsItem(
                icon: Icons.language,
                title: 'Language',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguageScreen()),
                  );
                },
              ),
              SettingsItem(
                icon: Icons.info,
                title: 'About',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutScreen()),
                  );
                },
              ),
              SettingsItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsCategory extends StatelessWidget {
  final String title;
  final List<SettingsItem> settings;

  const SettingsCategory({
    required this.title,
    required this.settings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          ...settings.map((setting) => setting).toList(),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
