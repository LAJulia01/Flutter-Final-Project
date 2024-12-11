import 'package:flutter/material.dart';
import 'package:nannycare/views/menu/menupage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nannycare/views/help_andsupport/helpandsupp_page3.dart';


class HelpandSupportPage extends StatelessWidget {
  const HelpandSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpSupportScreen(),
    );
  }
}

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A7A5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MenuPage())); // Go back to the previous screen
          },
        ),
        title: Text(
          'Help and Support',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, How can we Help you?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            SupportButton(
              icon: Icons.email,
              text: 'Send us an E-mail',
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'laurenceabjulia@gmail.com', // Replace with your support email
                  query: 'subject=&body=', // Optional
                );

                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not open email app')),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            SupportButton(
              text: 'FAQs',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpandsuppPage3()),
                ); // Navigate to HelpandsuppPage3
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;

  const SupportButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.red),
              SizedBox(width: 8.0),
            ],
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
