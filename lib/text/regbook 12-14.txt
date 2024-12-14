// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nannycare/views/widgets/bottom_navigation_bar.dart';

class BookingRequestPage extends StatefulWidget {
  final String userId;

  const BookingRequestPage({super.key, required this.userId});

  @override
  State<BookingRequestPage> createState() => BookingRequestPageState();
}

class BookingRequestPageState extends State<BookingRequestPage> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  String? _fcmToken; 
  final String fcmServerKey = '263cfc12c2e7a3481d9666e9ed1fc11a15e18321'; 
  bool _isLoading = false; 
  bool _isBookingConfirmed = false; // Tracks booking confirmation status

  @override
  void initState() {
    super.initState();
    _initializeFCMToken();
  }

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
    } catch (e) {
      debugPrint('Failed to retrieve FCM token: $e');
    }
  }

  Future<void> confirmBooking() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      await FirebaseFirestore.instance
          .collection('booking_requests')
          .doc(widget.userId)
          .update({'status': 'confirmed'});

      // Mark booking as confirmed to update the UI
      setState(() {
        _isBookingConfirmed = true;
        _isLoading = false;
      });

      debugPrint('Booking confirmed successfully');
    } catch (e) {
      debugPrint('Error confirming booking: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to confirm booking. Please try again.')),
      );
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

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

  void _saveBookingRequest() {
    if (startTime != null &&
        endTime != null &&
        (startTime!.hour > endTime!.hour ||
            (startTime!.hour == endTime!.hour &&
                startTime!.minute >= endTime!.minute))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Start time must be earlier than end time.')),
      );
      return;
    }

    setState(() {
      _isLoading = true; 
    });

    FirebaseFirestore.instance.collection('booking_requests').doc(widget.userId).set({
      'date': selectedDate?.toIso8601String(),
      'start_time': startTime?.format(context),
      'end_time': endTime?.format(context),
      'address': addressController.text,
      'notes': notesController.text,
    }).then((_) {
      debugPrint("Booking Request Updated");
      setState(() {
        _isLoading = false; 
      });
    }).catchError((error) {
      debugPrint("Failed to add booking request: $error");
      setState(() {
        _isLoading = false; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A7A5),
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Booking Request',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isBookingConfirmed 
              ? _buildConfirmationDetails() 
              : _buildBookingForm(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _isLoading ? null : confirmBooking,
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      ) 
                    : const Text(
                        'Confirm Booking',
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

  Widget _buildBookingForm() {
    return Column(
      children: [
        TextField(
          controller: addressController,
          decoration: const InputDecoration(
            labelText: 'Address',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: notesController,
          decoration: const InputDecoration(
            labelText: 'Notes',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Booking Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text('Date: ${selectedDate != null ? DateFormat('MM/dd/yyyy').format(selectedDate!) : 'Not set'}'),
        Text('Start Time: ${startTime != null ? startTime!.format(context) : 'Not set'}'),
        Text('End Time: ${endTime != null ? endTime!.format(context) : 'Not set'}'),
        Text('Address: ${addressController.text.isNotEmpty ? addressController.text : 'Not set'}'),
        Text('Notes: ${notesController.text.isNotEmpty ? notesController.text : 'Not set'}'),
      ],
    );
  }
}
