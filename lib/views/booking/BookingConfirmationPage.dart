// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nannycare/views/booking/Booking_SuccessPage.dart';

class BookingConfirmationPage extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String scheduleDate;
  final String dutyHours;
  final String address;
  final String notes;

  const BookingConfirmationPage({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.scheduleDate,
    required this.dutyHours,
    required this.address,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A7A5),
        elevation: 1,
        centerTitle: true,
        title: Text(
          'CONFIRMATION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              SizedBox(height: 12),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 24),
              _buildInfoSection(
                title: 'Schedule Date',
                icon: Icons.calendar_today,
                content: scheduleDate,
              ),
              _buildInfoSection(
                title: 'Duty Hours',
                icon: Icons.access_time,
                content: dutyHours,
              ),
              _buildInfoSection(
                title: 'Address',
                icon: Icons.home,
                content: address,
              ),
              _buildInfoSection(
                title: 'Notes',
                icon: Icons.notes,
                content: notes,
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    'Cancel',
                    Colors.black,
                    Colors.white,
                    () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildActionButton(
                    context,
                    'Confirm',
                    Colors.white,
                    const Color(0xFFF5A7A5),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingSuccesspage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.grey[700]),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    Color textColor,
    Color backgroundColor,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(120, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 3,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
