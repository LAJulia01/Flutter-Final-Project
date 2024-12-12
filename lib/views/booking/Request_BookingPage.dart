// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nannycare/babysitter/notificationpage2.dart';
import 'package:nannycare/views/booking/BookingConfirmationPage.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';

class BookingRequestPage extends StatefulWidget {
  final String documentId;

  const BookingRequestPage({super.key, required this.documentId});

  @override
  State<BookingRequestPage> createState() => BookingRequestPageState();
}

class BookingRequestPageState extends State<BookingRequestPage> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  String? _fcmToken; // FCM token
  final String _fcmServerKey = '263cfc12c2e7a3481d9666e9ed1fc11a15e18321'; // Replace with actual key

  @override
  void initState() {
    super.initState();
    _initializeFCMToken();
  }

  /// Retrieves and initializes the FCM token.
  Future<void> _initializeFCMToken() async {
    try {
      NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted permission');
        _fcmToken = await FirebaseMessaging.instance.getToken();
        debugPrint('FCM Token: $_fcmToken');
      } else {
        debugPrint('User declined or has not accepted permission');
      }

      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        _fcmToken = newToken;
        debugPrint('New FCM Token: $_fcmToken');
      });
    } catch (e) {
      debugPrint('Failed to retrieve FCM token: $e');
    }
  }

  /// Confirms the booking by updating Firestore and navigating to NotificationPage2.
  Future<void> confirmBooking(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('booking_requests')
          .doc(widget.documentId)
          .update({'status': 'confirmed'});

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotificationPage2(documentId: widget.documentId),
        ),
      );
    } catch (e) {
      debugPrint('Error confirming booking: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to confirm booking. Please try again.')),
      );
    }
  }

  /// Picks a date using the date picker.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  /// Picks a time using the time picker.
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  /// Saves the booking request to Firestore.
  void _saveBookingRequest() {
    if (addressController.text.isEmpty || notesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    FirebaseFirestore.instance.collection('booking_requests').add({
      'date': selectedDate?.toIso8601String(),
      'start_time': startTime?.format(context),
      'end_time': endTime?.format(context),
      'address': addressController.text,
      'notes': notesController.text,
    }).then((_) {
      debugPrint("Booking Request Added");
      _sendNotification();
    }).catchError((error) {
      debugPrint("Failed to add booking request: $error");
    });
  }

  /// Sends an FCM notification.
  Future<void> _sendNotification() async {
    if (_fcmToken != null) {
      try {
        final response = await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'key=$_fcmServerKey',
          },
          body: jsonEncode({
            'to': _fcmToken,
            'notification': {
              'title': 'New Booking Request',
              'body': 'You have a new booking request from ${addressController.text}'
            }
          }),
        );
        if (response.statusCode == 200) {
          debugPrint('Notification sent successfully');
        } else {
          debugPrint('Failed to send notification. Status code: ${response.statusCode}');
        }
      } catch (e) {
        debugPrint('Failed to send notification: $e');
      }
    } else {
      debugPrint('FCM Token is null, unable to send notification.');
    }
  }

  /// Builds the input section widget.
  Widget _buildInputSection(String title, IconData icon, String hintText,
      {Function()? onTap, String? secondHintText, Function()? secondOnTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                hintText: hintText,
                suffixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        if (secondHintText != null) ...[
          SizedBox(height: 8),
          GestureDetector(
            onTap: secondOnTap,
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  hintText: secondHintText,
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
        SizedBox(height: 16),
      ],
    );
  }

  /// Builds an editable input section.
  Widget _buildEditableInputSection(
      String title, IconData icon, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: "Input your $title here",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A7A5),
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Booking Request',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputSection(
              "Schedule Date",
              Icons.calendar_today,
              selectedDate != null
                  ? DateFormat('MM/dd/yyyy').format(selectedDate!)
                  : "Input Date",
              onTap: () => _selectDate(context),
            ),
            _buildInputSection(
              "Duty Hours",
              Icons.access_time,
              startTime?.format(context) ?? "Start Time",
              onTap: () => _selectTime(context, true),
              secondHintText: endTime?.format(context) ?? "End Time",
              secondOnTap: () => _selectTime(context, false),
            ),
            _buildEditableInputSection(
                "Address", Icons.home, addressController),
 _buildEditableInputSection("Notes", Icons.note, notesController),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveBookingRequest();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmationPage(
                        name: 'Nanny Care',
                        profileImageUrl: 'https://via.placeholder.com/150',
                        scheduleDate: selectedDate != null
                            ? DateFormat('MM/dd/yyyy').format(selectedDate!)
                            : 'Not set',
                        dutyHours: startTime != null && endTime != null
                            ? '${startTime!.format(context)} - ${endTime!.format(context)}'
                            : 'Not set',
                        address: addressController.text.isNotEmpty
                            ? addressController.text
                            : 'Not set',
                        notes: notesController.text.isNotEmpty
                            ? notesController.text
                            : 'Not set',
                      ),
                    ),
                  );
                },
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
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