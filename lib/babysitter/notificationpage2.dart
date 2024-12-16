// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nannycare/babysitter/bookRequest_view2.dart';
import 'package:nannycare/views/home/mainpage.dart';

class NotificationPage2 extends StatefulWidget {
  const NotificationPage2({super.key});
  static const route = './notification-screen';

  @override
  _NotificationPage2State createState() => _NotificationPage2State();
}

class _NotificationPage2State extends State<NotificationPage2> {
  // Firestore reference to the 'booking_requests' collection
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeLocalNotifications();
  }

  // Method to initialize local notifications
  void _initializeLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    _localNotificationsPlugin.initialize(initializationSettings);
  }

  // Method to show a local notification
  Future<void> _showLocalNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'booking_channel_id',
      'Booking Notifications',
      channelDescription: 'Channel for booking confirmations',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await _localNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
  }

  // Method to fetch booking data from Firestore
  Future<List<Map<String, dynamic>>> fetchBookingData() async {
    try {
      // Fetch all booking requests and return as a list of maps
      QuerySnapshot snapshot = await _firestore.collection('booking_requests').get();
      final bookingData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      // Check if any booking has the status 'confirmed' and trigger a notification
      for (var booking in bookingData) {
        if (booking['status'] == 'confirmed') {
          _showLocalNotification('Booking Confirmed', 'Your booking for ${booking['scheduleDate']} has been confirmed.');
          break;
        }
      }

      return bookingData;
    } catch (e) {
      print('Error fetching booking data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    
    // final message = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A7A5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainPage())); // Go back to the previous screen
          },
        ),
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Title: ${message?['notification']?['title'] ?? 'No title'}'),
            // Text('Body: ${message?['notification']?['body'] ?? 'No body'}'),
            // Text('Data: ${message?['data'] ?? 'No data'}'),
            SizedBox(height: 20),
            
            // Fetch and display booking data from Firestore
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchBookingData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error fetching data'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No bookings available'));
                  } else {
                    final bookings = snapshot.data!;
return ListView.builder(
  itemCount: bookings.length,
  itemBuilder: (context, index) {
    final booking = bookings[index];
    return GestureDetector(
      onTap: () {
        // Navigate to BookingSummary page with booking data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingSummary(booking: booking),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${booking['name'] ?? 'N/A'}',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Text('Schedule Date: ${booking['scheduleDate'] ?? 'N/A'}'),
              Text('Status: ${booking['status'] ?? 'N/A'}'),
            ],
          ),
        ),
      ),
    );
  },
);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
