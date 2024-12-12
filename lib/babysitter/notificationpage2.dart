import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';
import 'package:intl/intl.dart';

class NotificationPage2 extends StatelessWidget {
  final String documentId;

  const NotificationPage2({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // Handle the case where documentId is empty
    if (documentId.isEmpty) {
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('booking_requests')
            .doc(documentId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Booking not found.'));
          }

          var bookingData = snapshot.data!.data() as Map<String, dynamic>? ?? {};
          String date = _formatDate(bookingData['date']);
          String startTime = _formatDate(bookingData['start_time']);
          String endTime = _formatDate(bookingData['end_time']);
          String address = bookingData['address'] ?? 'No address provided.';
          String notes = bookingData['notes'] ?? 'No notes provided.';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('📅 Date:', date),
                _buildDetailRow('⏰ Start Time:', startTime),
                _buildDetailRow('⏳ End Time:', endTime),
                _buildDetailRow('🏠 Address:', address),
                _buildDetailRow('📝 Notes:', notes),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Formats Firestore Timestamps or DateTime objects to a readable string.
  String _formatDate(dynamic dateData) {
    if (dateData == null) return 'Not set';
    try {
      if (dateData is Timestamp) {
        return DateFormat('MM/dd/yyyy').format(dateData.toDate());
      } else if (dateData is DateTime) {
        return DateFormat('MM/dd/yyyy').format(dateData);
      } else if (dateData is String) {
        // If it's already a string, return it
        return dateData;
      } else {
        return 'Invalid date format';
      }
    } catch (e) {
      return 'Invalid date';
    }
  }

  /// Builds a styled row of title and value
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