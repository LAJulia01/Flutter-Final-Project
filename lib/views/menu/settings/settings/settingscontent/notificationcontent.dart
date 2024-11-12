import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nannycare/utils/styles/style/textstyle.dart';

class NotificationContent extends StatefulWidget {
  const NotificationContent({super.key});

  @override
  State<NotificationContent> createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {
  bool isSwitched = false;
  bool isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // center the content
      crossAxisAlignment:
          CrossAxisAlignment.start, //but to put it in the left side
      children: [
        //Notif Content here
        //switch, notif set
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlutterSwitch(
              value: isSwitched,
              onToggle: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.pink, // Color when the switch is on
              inactiveColor: Colors.black26, // Color when the switch is off
              width: 55.0, // Width of the switch
              height: 25.0, // Height of the switch
              toggleSize: 25.0, // Size of the toggle thumb
              borderRadius: 30.0, // Rounded corners
              padding: 4.0, // Padding inside the switch
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Notification settings',
              style: SettingsContent.subHeader,
            ),
          ],
        ),

        // warning descrip
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start, // This spreads icons out nicely
          children: [
            Row(
              children: [
                // Leading Icon
                IconButton(
                  icon: const Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                  iconSize: 17.0,
                  onPressed: () {
                    // Add logic for the leading icon, if necessary
                  },
                ),
              ],
            ),
            // Text
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 9),
                child: Text(
                  "Warning: this will disable all notifications in the app, including messages, matches, reminders, etc. You will not be notified of any activity in the app. Only proceed if you are absolutely sure you will not get any important notifications.",
                  style: SettingsContent.description,
                ),
              ),
            ),
          ],
        ),

        //switch, Email notif set
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlutterSwitch(
              value: isSwitched2,
              onToggle: (value) {
                setState(() {
                  isSwitched2 = value;
                });
              },
              activeColor: Colors.pink, // Color when the switch is on
              inactiveColor: const Color.fromARGB(
                  255, 196, 196, 196), // Color when the switch is off
              width: 55.0, // Width of the switch
              height: 25.0, // Height of the switch
              toggleSize: 25.0, // Size of the toggle thumb
              borderRadius: 30.0, // Rounded corners
              padding: 4.0, // Padding inside the switch
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Email notification settings',
              style: SettingsContent.subHeader,
            ),
          ],
        ),

        // Emaill notif set, description
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start, // This spreads icons out nicely
          children: [
            // Text
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 9),
                child: Text(
                  "This will disable weekly emails",
                  style: SettingsContent.description,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 20,
        ),

        //btn
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ), // Button padding
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
        )
      ],
    );
  }
}
