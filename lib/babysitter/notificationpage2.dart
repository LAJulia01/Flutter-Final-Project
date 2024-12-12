import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nannycare/utils/styles.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';

class NotificationsPage2 extends StatefulWidget {
  const NotificationsPage2({super.key});

  @override
  State<NotificationsPage2> createState() => _NotificationsPage2State();
}

class _NotificationsPage2State extends State<NotificationsPage2> with GlobalStyles {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 3),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('notifications').orderBy('date', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No notifications yet.',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
            );
          }

          final notifications = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              final title = notification['title'] ?? 'No Title';
              final message = notification['message'] ?? 'No Message';
              final timestamp = notification['date']?.toDate() ?? DateTime.now();

              return notificationDetails(
                '$title\n$message\n${DateFormat.yMMMd().add_jm().format(timestamp)}',
                semiSecondaryText,
                width,
                () {},
              );
            },
          );
        },
      ),
    );
  }

  Widget notificationDetails(String text, TextStyle textStyle, double width, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4, spreadRadius: 2)],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Color(0xFFF5A7A5)),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/marga_image1.jpg'),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                textAlign: TextAlign.justify,
                text,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
