import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';


class NotificationPage2 extends StatelessWidget {
  final String documentId;

  const NotificationPage2({super.key, required this.documentId});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(
        title: 'Notification',
        context: context, 
        style: TextStyle(), 
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('booking_requests')
            .doc(documentId) // Use the document ID of the saved booking
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Booking not found.'));
          }

          var bookingData = snapshot.data!;
          String date = bookingData['date'] ?? 'Not set';
          String startTime = bookingData['start_time'] ?? 'Not set';
          String endTime = bookingData['end_time'] ?? 'Not set';
          String address = bookingData['address'] ?? 'Not set';
          String notes = bookingData['notes'] ?? 'Not set';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Date:', date),
                _buildDetailRow('Start Time:', startTime),
                _buildDetailRow('End Time:', endTime),
                _buildDetailRow('Address:', address),
                _buildDetailRow('Notes:', notes),
              ],
            ),
          );
        },
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
          SizedBox(width: 8),
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