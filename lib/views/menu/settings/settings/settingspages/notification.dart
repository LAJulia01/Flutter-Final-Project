import 'package:final_project/views/menu/settings/settings/settingspages/widgets/toggle_switch_widget.dart';
import 'package:final_project/views/menu/widgets/settings_appbar_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isNotificationEnabled = false;
  bool isSoundEnabled = false;
  bool isVibrateEnabled = false;
  bool isPromotionTipsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(
        title: 'Notifications',
        context: context,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              children: [
                toggleSwitch(
                  title: 'Show Notification',
                  switchValue: isNotificationEnabled,
                  onToggle: (value) {
                    setState(() {
                      isNotificationEnabled = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.red[400],
                        size: 24,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                        child: Text(
                          'Warning: This will disable all notifications in the app, including messages, matches, reminders, etc. You will not be notified of any activity in the app. Only proceed if you are absolutely sure you will not get any important notifications.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.0, // Thickness of the line
              color: Colors.grey, // Line color
              indent: 5.0, // Left padding
              endIndent: 5.0, // Right padding
            ),
            const SizedBox(
              height: 10,
            ),
            toggleSwitch(
              title: 'Sound',
              switchValue: isSoundEnabled,
              onToggle: (value) {
                setState(() {
                  isSoundEnabled = value;
                });
              },
            ),
            toggleSwitch(
              title: 'Vibrate',
              switchValue: isVibrateEnabled,
              onToggle: (value) {
                setState(() {
                  isVibrateEnabled = value;
                });
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1.0, // Thickness of the line
              color: Colors.grey, // Line color
              indent: 5.0, // Left padding
              endIndent: 5.0, // Right padding
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                toggleSwitch(
                  title: 'Promotions and Tips',
                  switchValue: isPromotionTipsEnabled,
                  onToggle: (value) {
                    setState(() {
                      isPromotionTipsEnabled = value;
                    });
                  },
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.question_mark_rounded,
                        color: Color(0xFFF5A7A5),
                        size: 24,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          'Receive coupons, promotions, surveys, product updates, and inspiration from (title) and its partners.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5A7A5),
                  padding: const EdgeInsets.all(20), // Button padding
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
