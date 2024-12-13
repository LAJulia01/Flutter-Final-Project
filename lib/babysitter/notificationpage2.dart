import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/widgets/settings_appbar_widget.dart';
import 'package:intl/intl.dart';

class NotificationPage2 extends StatefulWidget {
  final String userId;

  const NotificationPage2({super.key, required this.userId});

  @override
  _NotificationPage2State createState() => _NotificationPage2State();
}

class _NotificationPage2State extends State<NotificationPage2> {
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
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('booking_requests')
              .doc(widget.userId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return _buildErrorWidget(context);
            }

            if (!snapshot.hasData || !(snapshot.data?.exists ?? false)) {
              return _buildEmptyBookingWidget();
            }

            var bookingData = snapshot.data?.data() as Map<String, dynamic>? ?? {};
            String date = _formatDate(bookingData['date']);
            String startTime = _formatDate(bookingData['start_time'], isTime: true);
            String endTime = _formatDate(bookingData['end_time'], isTime: true);
            String address = (bookingData['address'] ?? '').isEmpty ? 'No address provided' : bookingData['address'];
            String notes = (bookingData['notes'] ?? '').isEmpty ? 'No notes provided' : bookingData['notes'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('📅 Date:', date),
                _buildDetailRow('⏰ Start Time:', startTime),
                _buildDetailRow('⏳ End Time:', endTime),
                _buildDetailRow('🏠 Address:', address),
                _buildDetailRow('📝 Notes:', notes),
              ],
            );
          },
        ),
      ),
    );
  }

  String _formatDate(dynamic dateData, {bool isTime = false}) {
    if (dateData == null) return 'Not set';
    try {
      if (dateData is Timestamp) {
        return isTime 
          ? DateFormat('hh:mm a').format(dateData.toDate()) 
          : DateFormat('MM/dd/yyyy').format(dateData.toDate());
      } else if (dateData is DateTime) {
        return isTime 
          ? DateFormat('hh:mm a').format(dateData) 
          : DateFormat('MM/dd/yyyy').format(dateData);
      } else if (dateData is String) {
        return dateData;
      } else {
        return 'Invalid date format';
      }
    } catch (e) {
      return 'Invalid date';
    }
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

  Widget _buildErrorWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          const Text(
            'An error occurred while loading the booking details.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {}); // This forces a rebuild
          //   },
          //   child: const Text('Retry'),
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Go back
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NotificationPage2(userId: widget.userId),
                ),
              ); // Reload page
            },
            child: const Text('Retry'),
          )

        ],
      ),
    );
  }

  Widget _buildEmptyBookingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_busy, color: Colors.grey, size: 48),
          const SizedBox(height: 16),
          const Text(
            'No booking found for this request.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please try again later or check if you have an active booking request.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
