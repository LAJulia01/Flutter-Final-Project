import 'package:flutter/material.dart';


class HelpandsuppPage2 extends StatelessWidget {
  const HelpandsuppPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GmailScreen(),
    );
  }
}

class GmailScreen extends StatelessWidget {
  const GmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: Text(
          'Gmail',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EmailFormField(label: 'From :'),
            SizedBox(height: 20),
            EmailFormField(label: 'To :'),
            SizedBox(height: 20),
            EmailFormField(label: 'Subject :'),
            SizedBox(height: 20),
            EmailFormField(label: 'Compose Email :', maxLines: 5),
          ],
        ),
      ),
    );
  }
}

class EmailFormField extends StatelessWidget {
  final String label;
  final int maxLines;

  const EmailFormField({
    super.key,
    required this.label,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8.0),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
        ),
      ],
    );
  }
}
