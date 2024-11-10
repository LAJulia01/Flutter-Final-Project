import 'package:final_project/views/menu/settings/settings/settingscontent/privacycontent/blockedaccount.dart';
import 'package:final_project/views/menu/settings/settings/settingscontent/privacycontent/changepasswordcontent.dart';
import 'package:final_project/views/menu/widgets/navigation_button_widget.dart';
import 'package:final_project/views/menu/widgets/settings_appbar_widget.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(
        title: 'Privacy',
        context: context,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            navigationButton(
              icon: Icons.password_rounded,
              label: 'Change Password',
              page: const ChangePasswordContent(),
              context: context,
            ),
            navigationButton(
              icon: Icons.block_rounded,
              label: 'Block Users',
              page: const BlockedAccountContent(),
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
