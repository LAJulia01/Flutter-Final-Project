import 'package:flutter/material.dart';
import 'package:nannycare/utils/styles.dart';
import 'package:nannycare/views/notifications/bookRequest_view.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}



Widget notificationDetails(
        String text, TextStyle textStyle, double width, Function() functions) =>
    InkWell(
      onTap: functions,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Color(0xFFF5A7A5))),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/marga_image1.jpg'),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
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

class _NotificationsPageState extends State<NotificationsPage>
    with GlobalStyles {
      
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 3),
      appBar: AppBar(
        title: Text('Notification',
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'poppins',
            )),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'New',
                style: secondaryText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            notificationDetails(
                'Shyne Del Rosario you’ve received a new request from Melissa for babysitting on September 03, 2024.',
                semiSecondaryText,
                width, () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: Color(0xFFF5A7A5))),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/marga_image1.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.justify,
                            'Shyne Del Rosario you’ve received a new request from Melissa for babysitting on September 03, 2024.',
                            style: semiSecondaryText,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookingSummary(booking: {},)));
                                });
                              },
                              style: btnStyle(GlobalStyles.buttonColorsmall),
                              child: const Text('View'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              style: btnStyle(GlobalStyles.softGray),
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
            }),
            notificationDetails(
                'Urgent Babysitting Needed! Last-minute job 1 mile away! Babysit tonight from 7 PM to midnight. Click for details.',
                semiSecondaryText,
                width,
                () {}),
            notificationDetails(
                'Great Babysitting Gig Nearby! Family with a toddler 2 blocks away needs help this evening.',
                semiSecondaryText,
                width,
                () {}),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Earlier',
                style: secondaryText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            notificationDetails(
                'Great Babysitting Nearby! Family with a 2 children 2 blocks away needs help this evening. ',
                semiSecondaryText,
                width,
                () {}),
            notificationDetails(
                'Urgent Babysitting Needed! Last-minute job 1 mile away! Babysit tonight from 3 PM to 8 PM.',
                semiSecondaryText,
                width,
                () {}),
            notificationDetails(
                'Shyne Del Rosario you’ve received a new request from Melissa for babysitting on September 03, 2024.',
                semiSecondaryText,
                width,
                () {}),
          ],
        ),
      ),
    );
  }
}
