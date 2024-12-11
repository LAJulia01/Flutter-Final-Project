import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GmailScreen extends StatelessWidget {
  const GmailScreen({super.key});

Future<void> composeEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'laurenceabjulia@gmail.com',
    queryParameters: {
      'subject': 'Test',
      'body': 'testing',
    },
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication, // Ensure the app opens in an external app
    );
  } else {
    throw 'Could not launch $emailUri';
  }
}


  @override
  Widget build(BuildContext context) {
    final TextEditingController toController = TextEditingController();
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Gmail', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EmailFormField(label: 'To:', controller: toController),
            SizedBox(height: 20),
            EmailFormField(label: 'Subject:', controller: subjectController),
            SizedBox(height: 20),
            EmailFormField(label: 'Body:', controller: bodyController, maxLines: 5),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final to = toController.text.trim();
                final subject = subjectController.text.trim();
                final body = bodyController.text.trim();

                if (to.isNotEmpty) {
                  composeEmail(

                  );
                } else {
                  // Show an error if the "To" field is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a recipient email address.')),
                  );
                }
              },
              child: Text('Compose Email in Gmail'),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const EmailFormField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
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
