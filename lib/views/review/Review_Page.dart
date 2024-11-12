// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Review Ratings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReviewCard(
                'Marga Toting',
                '5 mins ago',
                'assets/marga_image1.jpg',
                'assets/marga_image2.jpg',
              ),
              SizedBox(height: 16),
              _buildReviewCard(
                'Roxanne Apple',
                '7 days ago',
                'assets/roxanne_image1.jpg',
                'assets/roxanne_image2.jpg',
              ),
              SizedBox(height: 16),
              _buildReviewCard(
                'Sofia Smith',
                '15 days ago',
                'assets/sofia_image1.jpg',
                'assets/sofia_image2.jpg',
              ),
              // Add more review cards as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(
      String name, String timeAgo, String image1, String image2) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Our baby has colic, and finding a sitter who is both patient and knowledgeable was a challenge until we met this Babysitter. I like the quality service of the Babysitter hopefully to book you again.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    image1,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Image.asset(
                    image2,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              timeAgo,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
