// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationPage2 extends StatelessWidget {
  NotificationPage2({super.key});
  static const route = './notification-screen';

  // Firestore reference to the 'booking_requests' collection
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch booking data from Firestore
  Future<List<Map<String, dynamic>>> fetchBookingData() async {
    try {
      // Fetch all booking requests and return as a list of maps
      QuerySnapshot snapshot = await _firestore.collection('booking_requests').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching booking data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                  Text('Duty Hours: ${booking['dutyHours'] ?? 'N/A'}'),
                                  Text('Address: ${booking['address'] ?? 'N/A'}'),
                                  Text('Notes: ${booking['notes'] ?? 'N/A'}'),
                                  Text('Status: ${booking['status'] ?? 'N/A'}'),
                                  Text('Created At: ${booking['createdAt']?.toDate().toString() ?? 'N/A'}'),
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
