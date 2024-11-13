import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/settings/settings/settingspages/deleteaccount.dart';
import 'package:nannycare/views/menu/settings/settings/settingspages/languages.dart';
import 'package:nannycare/views/menu/settings/settings/settingspages/notification.dart';
import 'package:nannycare/views/menu/settings/settings/settingspages/privacy.dart';
import 'package:nannycare/views/menu/widgets/navigation_button_widget.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(
        title: 'Settings',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              // navigationButton(
              //   icon: Icons.edit_notifications_rounded,
              //   label: 'Notification',
              //   page: const NotificationPage(),
              //   context: context,
              // ),
              navigationButton(
                icon: Icons.lock_rounded,
                label: 'Privacy',
                page: const PrivacyPage(),
                context: context,
              // ),
              // navigationButton(
              //   icon: Icons.language_rounded,
              //   label: 'Language',
              //   page: const LanguagePage(),
              //   context: context,
              // ),
              // navigationButton(
              //   icon: Icons.delete_rounded,
              //   label: 'Delete Account',
              //   page: const DeleteAccoung(),
              //   context: context,
              // ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
