import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';
// import 'package:intl/intl.dart';

class NotificationPage2 extends StatefulWidget {
  final String userId;
  final String payload;

  const NotificationPage2({super.key, required this.userId, required this.payload});

  @override
  _NotificationPage2State createState() => _NotificationPage2State();
}

class _NotificationPage2State extends State<NotificationPage2> {
  late Map<String, dynamic> bookingData;

  @override
  void initState() {
    super.initState();
    bookingData = jsonDecode(widget.payload);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userId.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Notification')),
        body: const Center(child: Text('Invalid document ID')),
      );
    }

    return Scaffold(
      appBar: settingsAppBar(
        title: 'Notification',
        context: context,
        style: const TextStyle(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('📅 Date:', bookingData['date']),
            _buildDetailRow('⏰ Start Time:', bookingData['start_time']),
            _buildDetailRow('⏳ End Time:', bookingData['end_time']),
            _buildDetailRow('🏠 Address:', bookingData['address']),
            _buildDetailRow('📝 Notes:', bookingData['notes']),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}