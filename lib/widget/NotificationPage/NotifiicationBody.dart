import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/styles.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody(
      {super.key, required this.header, required this.subHeader});

  final String header;
  final String subHeader;

  @override
  State<NotificationBody> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationBody> {
  bool value = false;
  bool value1 = false;

  Widget switches(bool state, Function(bool) onChanged, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GlobalStyles.textStyle(
                15, GlobalStyles.leadingColor, FontWeight.w500),
          ),
          Switch(
            value: state,
            onChanged: onChanged,
            activeColor: GlobalStyles.switchColor,
          )
        ],
      );

  Widget switchButtons() => Container(
        decoration: BoxDecoration(
          color: GlobalStyles.containerColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: GlobalStyles.paddingStyle(20, 10),
        child: Column(
          children: [
            switches(value, (val) {
              setState(() {
                value = val;
              });
            }, 'Emails'),
            const Divider(),
            switches(value1, (val) {
              setState(() {
                value1 = val;
              });
            }, 'Push Notifications'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: GlobalStyles.paddingStyle(20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.header,
            style: GlobalStyles.textStyle(
                20, GlobalStyles.leadingColor, FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.subHeader,
            style: GlobalStyles.textStyle(
                15, GlobalStyles.leadingColor, FontWeight.normal),
            // textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          switchButtons(),
        ],
      ),
    );
  }
}
