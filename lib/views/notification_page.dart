import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/widget/CustomAppBar.dart';
import 'package:module2_4_lab_exercise/widget/NotificationPage/NotifiicationBody.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          leadingWidth: width,
          leading: const CustomAppBar(title: 'Notification')),
      body: ListView(
        clipBehavior: Clip.none,
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationBody(
                header: "Messages",
                subHeader:
                    'Receive messages from members, including booking request.',
              ),
              SizedBox(height: 10),
              NotificationBody(
                header: "Reminders",
                subHeader:
                    'Receive booking reminders, request to write a review, and other reminders related to your activities on Nanny Care.',
              ),
              SizedBox(height: 10),
              NotificationBody(
                header: "Promotions and tips",
                subHeader:
                    'Receive coupons, promotions, surveys, product updates, and inspiration from Nanny Care and its partners.',
              ),
              NotificationBody(
                header: "Account Support",
                subHeader:
                    'We may need to send you messages regarding your account, bookings, legal notifications, security and privacy matters, and customer support request. For your security, you cannot disable support email notifications and we may contact you by phone or other means if needed.',
              ),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
